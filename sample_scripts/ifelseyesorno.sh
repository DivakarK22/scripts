
#!/bin/bash

echo Whats your Name?
read a
echo Hello $a
echo
echo "You want to create a new file called ifelsetest.txt (y/n) ?"
read y

if [ "$y" == y ]
then
  echo Creating new file ifelsetest.txt
  touch ifelsetest.txt
elif [ "$y" == n ]
then
  echo Not creating anything
fi
