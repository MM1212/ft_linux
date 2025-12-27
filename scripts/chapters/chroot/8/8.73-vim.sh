#!/bin/bash
set -e

cd /sources

tar -xf vim-9.1.1629.tar.gz
cd vim-9.1.1629

# Change the default location of the vimrc configuration file to /etc
echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h

./configure --prefix=/usr

make

make install

# Create symlink for vi
ln -sv vim /usr/bin/vi
for L in /usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done

# Create symlink for documentation
ln -sv ../vim/vim91/doc /usr/share/doc/vim-9.1.1629

# Create default vim configuration file
cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc

" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1

set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif

" End /etc/vimrc
EOF

cd /sources
rm -rf vim-9.1.1629
