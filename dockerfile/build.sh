#!/bin/bash
cd `dirname $0`
filelist=`ls`
for file in $filelist
do
  if [ -d $file ]; then
    docker build -t $file ./$file/
  fi
done
