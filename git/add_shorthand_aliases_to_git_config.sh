#!/usr/bin/env bash
cat << EOF >> ~/.gitconfig
[alias]
  co = checkout
  ci = commit
  st = status
  br = branch
  hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
  type = cat-file -t
  dump = cat-file -p
EOF

git config --global core.editor vim


#set no reply email address

git config --global user.email "1911935+crimesp@users.noreply.github.com"
