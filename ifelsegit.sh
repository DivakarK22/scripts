

#!/bin/bash

gitdir=`cd /root/scripts`

cd $gitdir

echo select the repo

read $gitfolder

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
