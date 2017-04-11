#!/bin/bash
cd `dirname $0`
curPwd=`pwd`

function buildDockerImage()
{
  filelist=`ls`
  for file in $filelist
  do
    if [ -d $file ]; then
      docker build -t $file ./$file/
      if [ $? -ne 0 ]; then
        exit
      fi
      cd $file
      buildDockerImage
      cd ..
    fi
  done
}

buildDockerImage
