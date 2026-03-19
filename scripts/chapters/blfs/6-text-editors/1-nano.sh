#! /bin/bash

set -e

cd /sources

tar -xvpf nano-8.6.tar.xz

cd nano-8.6

./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --enable-utf8     \
            --docdir=/usr/share/doc/nano-8.6

make

make install
install -v -m644 doc/{nano.html,sample.nanorc} /usr/share/doc/nano-8.6

cat > /etc/nanorc << EOF
set autoindent
set constantshow
set fill 72
set historylog
set multibuffer
set positionlog
set quickblank
set regexp
include /usr/share/nano/*.nanorc
EOF

cd ..

rm -rf nano-8.6