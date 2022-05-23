# Author - Sathis Kumar Raju - sathiskumar.raju@astrazeneca.com
# Description - This script will just remove entimICE temporary files

#!/bin/bash

log_target=/san2/archive_temp_log
day=`date +%d%m%Y`

cd $log_target
ret=$?
if [ "$ret" -ne 0 ]
then
        exit -1
fi

mkdir readEnc_$day
find /entimice/filesystem/temp -maxdepth 1 -type d -name "readEnc*"  -mmin +1440 -exec mv {} $log_target/readEnc_$day \;

find /entimice/filesystem/temp -maxdepth 1 -type d -name "readEnc*"  -mmin +1440 -exec rm -rf {} \;
