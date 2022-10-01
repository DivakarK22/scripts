

#!/bin/bash

gitdir=`cd /root/scripts`

cd $gitdir

echo select the repo

read $gitfolder

echo Checking $gitfolder

cd $gitfolder

echo running git pull

gitpull=`git pull | awk '{print $1}'`

if [ "$gitpull" == 'Already' ]
then
  echo "Already on top"
else 
  echo "Repo is updaing now"
fi

