#!/bin/bash

set -e

cd "$LFS"/sources

# Unpack GCC
tar -xvpf gcc-15.2.0.tar.xz

cd gcc-15.2.0

# Unpack dependencies
DEPENDENCIES=( "mpfr-4.2.2.tar.xz" "gmp-6.3.0.tar.xz" "mpc-1.3.1.tar.gz" )
for package in "${DEPENDENCIES[@]}"; do
  if [ ! -f "../$package" ]; then
    echo "Error: Dependency $package not found in sources directory."
    exit 1
  fi
  tar -xvpf "../$package"
  PACKAGE_NAME=$(cut -d- -f1 <<< "$package")
  PACKAGE_EXT="$(basename "$package" | rev | cut -d. -f1-2 | rev)"
  PACKAGE_WITHOUT_EXT=$(basename "$package" .$PACKAGE_EXT)
  mv -v $PACKAGE_WITHOUT_EXT $PACKAGE_NAME
done

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
 ;;
esac

mkdir -v build
cd build

../configure \
  --target=$LFS_TGT         \
  --prefix=$LFS/tools       \
  --with-glibc-version=2.42 \
  --with-sysroot=$LFS       \
  --with-newlib             \
  --without-headers         \
  --enable-default-pie      \
  --enable-default-ssp      \
  --disable-nls             \
  --disable-shared          \
  --disable-multilib        \
  --disable-threads         \
  --disable-libatomic       \
  --disable-libgomp         \
  --disable-libquadmath     \
  --disable-libssp          \
  --disable-libvtv          \
  --disable-libstdcxx       \
  --enable-languages=c,c++

make

make install

cd ..
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/include/limits.h

cd ../

rm -rf gcc-15.2.0