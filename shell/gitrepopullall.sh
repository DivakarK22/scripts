#!/bin/bash

#Read repo name
read -p "Enter the repo username to clone:" repo_name 

#Create git under user home dir
mkdir /$HOME/git

<<<<<<< HEAD
#INSTALL GIT
yum install git -y
=======
#Create a folder
mkdir /$HOME/git/$repo_name

>>>>>>> c1e5666 (updated)
#Collecting repo details
curl https://github.com/$repo_name?tab=repositories | grep "<a href=" | grep itemprop | awk '{print $2}' > /$HOME/git/garbage.txt
cut -c6- /$HOME/git/garbage.txt > /$HOME/git/repo_tmp.txt
cat /$HOME/git/repo_tmp.txt | sed 's/"//g' > /$HOME/git/repo.txt

#Using txt file
file="/$HOME/git/repo.txt"

#Cloning repo's
while read -r line; do
cd /$HOME/git/$repo_name
git clone https://github.com/$line.git
done <$file

#Removing tmp's
rm -rf /$HOME/git/garbage.txt /$HOME/git/repo_tmp.txt /$HOME/git/repo.txt



