#!/bin/sh

if ! type "luajit" > /dev/null ; then
  echo "LuaJIT not found!"
  exit 1
fi

if ! type "busted" > /dev/null ; then
  echo "busted not found!"
  exit 1
fi

busted --lua=luajit --lpath=soup-kitchen/?.lua tests/
