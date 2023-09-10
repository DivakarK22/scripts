#!/bin/bash

read -p "Enter the repo username to clone:" repo_name
mkdir /$HOME/git

curl https://github.com/$repo_name?tab=repositories | grep "<a href=" | grep itemprop | awk '{print $2}' > /$HOME/git/garbage.txt
cut -c6- /$HOME/git/garbage.txt > /$HOME/git/repo_tmp.txt
cat /$HOME/git/repo_tmp.txt | sed 's/"//g' > /$HOME/git/repo.txt
rm -rf /$HOME/git/garbage.txt /$HOME/git/repo_tmp.txt

file="/$HOME/git/repo.txt"

while read -r line; do
cd /$HOME/git
git clone https://github.com/$line.git
done <$file

echo exit




