#!/bin/bash

#Read repo name
read -p "Enter the repo username to clone:" repo_name 

echo "Creating git folder under Home directory"
#Create git under user home dir
mkdir /$HOME/git

echo " Install git "
#INSTALL GIT
yum install git -y

echo " Making default repo directory /$HOME/git/$repo_name"
#Create a user folder
mkdir /$HOME/git/$repo_name

echo "Collecting $repo_name details from github"
#Collecting repo details
curl https://github.com/$repo_name?tab=repositories | grep "<a href=" | grep itemprop | awk '{print $2}' > /$HOME/git/garbage.txt
cut -c6- /$HOME/git/garbage.txt > /$HOME/git/repo_tmp.txt
cat /$HOME/git/repo_tmp.txt | sed 's/"//g' > /$HOME/git/repo.txt

#Using txt file
file="/$HOME/git/repo.txt"

echo " Cloning all repos from user $repo_name"
#Cloning repo's
while read -r line; do
cd /$HOME/git/$repo_name
git clone https://github.com/$line.git
done <$file

#Removing tmp's
echo " Removing temp files /$HOME/git/garbage.txt /$HOME/git/repo_tmp.txt /$HOME/git/repo.txt "
rm -rf /$HOME/git/garbage.txt /$HOME/git/repo_tmp.txt /$HOME/git/repo.txt



