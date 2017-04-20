#!/bin/bash
set -e
cd `dirname $0`
curPwd=`pwd`
filelist=`ls`
for file in $filelist
do
  if [ -d $file ]; then
    cd $file
    # tag:lastest
    if [ -f Dockerfile ]; then
      docker build -t $file .
      #backup
      mv Dockerfile Dockerfile-backup
    fi

    # tag:xxx
    second_folder=`ls`
    for se in $second_folder
    do
      if [[ -d $se && -f $se/Dockerfile ]]; then
        cp $se/Dockerfile ./
        docker build -t $file:$se .
        rm Dockerfile
      fi
    done
    
    # revert
    if [ -f Dockerfile-backup ]; then
      #backup
      mv Dockerfile-backup Dockerfile
    fi
    cd ..
  fi
done

exit 0