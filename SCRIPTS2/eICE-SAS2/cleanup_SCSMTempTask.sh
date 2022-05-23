# Author - Sathis Kumar Raju - sathiskumar.raju@astrazeneca.com
# Description - This script will archive and cleanup entimICE log files

#!/bin/bash

day=`date +%d%m%Y`
ar_file_autoexec=/entimice/housekeeping/archive/archival_autoexec_$day.tar

#find /entimice/filesystem/temp/sas/tmp -maxdepth 1 -type f -name "SCSMTempTask*" -mtime +2 -exec tar rvf $ar_file_autoexec {} \;


log_target=/san2/archive_temp_log
day=`date +%d%m%Y`


cd $log_target
ret=$?
if [ "$ret" -ne 0 ]
then
        exit -1
fi

mkdir SCSMTempTask_$day
find /entimice/filesystem/temp/sas/tmp -maxdepth 1 -type f -name "SCSMTempTask*" -mtime +2 -exec mv {} $log_target/SCSMTempTask_$day \;


find /entimice/filesystem/temp/sas/tmp -maxdepth 1 -type f -name "SCSMTempTask*" -mtime +2 -exec rm -rf {} \;

