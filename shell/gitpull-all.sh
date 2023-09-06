#!/bin/bash

#var

cd $HOME/git

for D in ./*; do
    if [ -d "$D" ]; then
     echo "cd'ing to $D"
        cd "$D"
     echo "Pulling latest update from $D , Reverting unsaved data"
        git stash
        git pull
        echo "exiting from $D"
        cd ..
        date
    fi
done
