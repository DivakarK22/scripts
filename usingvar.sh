
#!/bin/bash

#!/bin/bash

#VARIABLES
remove=`rm -rf top.txt`
t=`top | head -10 > top.txt`
file=`chown devops:devops top.txt`

echo
$remove
echo
pwd
echo
$t
echo
$file
echo EOF

