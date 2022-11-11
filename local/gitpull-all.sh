#!/bin/bash

#var

cd $HOME/git

for D in ./*; do
    if [ -d "$D" ]; then
     echo "cd'ing to $D"
        cd "$D"
     echo "pulling latest"
        git pull
        cd ..
     echo "exiting from Dir"
    fi
done
