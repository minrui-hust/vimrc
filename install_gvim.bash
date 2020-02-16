#! /bin/bash

# Give up when error happens
#set -e

# Check if vim repo exist, if not clone one from github
if [ ! -d "./vim" ]; then
  git clone --depth=1 https://github.com/vim/vim.git
fi

# Install dependencies
apt-get install python-dev python3-dev libperl-dev liblua5.3-dev libgtk2.0-dev libxpm-dev libxt-dev -y

# Goto vim source directory and clean previous settings
cd ./vim/src
make distclean

# configure vim
./configure \
--with-features=huge \
--enable-gui=gtk2 --with-x \
--enable-python3interp=yes \
--enable-pythoninterp=yes \
--enable-luainterp=yes \
--enable-perlinterp=yes \
--enable-multibyte \
--enable-cscope  

# make and install
make & make install


