# Author - Sathis Kumar Raju - sathiskumar.raju@astrazeneca.com
# Description - This script will archive and cleanup entimICE log files

#!/bin/bash

day=`date +%d%m%Y`
ar_file_ai=/entimice/housekeeping/archive/archival_file_import_$day.tar

#find /entimice/filesystem/temp -maxdepth 1 -type d -name "file_import*" -mtime +1 -exec tar rvf $ar_file_ai {} \;


log_target=/san2/archive_temp_log
day=`date +%d%m%Y`


cd $log_target
ret=$?
if [ "$ret" -ne 0 ]
then
        exit -1
fi

mkdir file_import_$day
find /entimice/filesystem/temp -maxdepth 1 -type d -name "file_import*" -mmin +1440 -exec mv {} $log_target/file_import_$day \;


find /entimice/filesystem/temp -maxdepth 1 -type d -name "file_import*" -mmin +1440 -exec rm -rf {} \;


