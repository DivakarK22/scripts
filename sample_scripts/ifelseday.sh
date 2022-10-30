
#!/bin/bash

#VAR

date=`date | awk '{print $1}'`

if [ "$date" == Sat ]
then
  echo Today is $date
else
  echo Today is not Monday
fi
