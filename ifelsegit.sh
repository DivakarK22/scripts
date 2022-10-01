

#!/bin/bash

cd $HOME/git

echo select the repo

read gitfolder


pwd

if [ -e "$gitfolder" ]
then
  cd $gitfolder
  gitpull=`git pull | awk '{print $1}'`
    if [ "$gitpull" == 'Already' ]
    then
      echo "Already on top"
    else
      echo "Repo is updaing now"
    fi
else
  echo folder not Exist Quitting
fi

#Modified ((Checking))
