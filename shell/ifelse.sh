#!/bin/bash

#VAR
pwd=`pwd`


if [ -e $pwd/top.txt ]
then
  echo file exist
else
  echo file not exist
fi
