#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
set -ex

OS="`uname`"
case $OS in
  'Linux')
    OS='Linux'
    ;;
  'WindowsNT')
    OS='Windows'
    ;;
  'Darwin')
    OS='Mac'
add(){
if ! [ -x "$(command -v $1)" ]; then
  brew install $1
fi
}
init(){
add node
add scons
brew install sdl2
}
    ;;
  *) ;;
esac


if [ ! -d lib/awtk ]; then
mkdir -p lib
cd lib
init
git clone https://gitee.com/zlgopen/awtk.git --depth=1
cd awtk; scons
fi
