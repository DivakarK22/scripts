
#!/bin/bash

#!/bin/bash

#VARIABLES
remove=`rm -rf top.txt`
t=`top | head -10 > top.txt`
file=`chown devops:devops top.txt`
pwd=`pwd`
echo Removing Old file
echo
$remove
echo Working on $pwd
echo
echo Creating file named top.txt and adding values
$t
echo Changing Permissions
$file
echo End of script

