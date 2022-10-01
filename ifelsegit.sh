

#!/bin/bash

cd $HOME/git

echo select the repo

read gitfolder

cd $gitfolder

pwd 

if [ -e "$gitfolder" ]

then 
   echo folder not Exist Quitting
else
   cd $gitfolder

   gitpull=`git pull | awk '{print $1}'`

   if [ "$gitpull" == 'Already' ]
   then
     echo "Already on top"
   else 
     echo "Repo is updaing now"
   fi
fi
