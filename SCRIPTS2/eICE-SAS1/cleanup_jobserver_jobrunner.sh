# Author - Sathis Kumar Raju - sathiskumar.raju@astrazeneca.com
# Description - This script will archive and cleanup entimICE log files

#!/bin/bash


day=`date +%d%m%Y`
ar_file_js_jr=/entimice/housekeeping/archive/archival_jobserver_jobrunner_$day.tar

#find /entimice/filesystem/temp -maxdepth 1 -type d -name "jobserver*_jobRunner*" -mtime +1 -exec tar rvf $ar_file_js_jr {} \;


log_target=/san2/archive_temp_log
day=`date +%d%m%Y`


cd $log_target
ret=$?
if [ "$ret" -ne 0 ]
then
        exit -1
fi

mkdir jobserver_jobRunner_$day
find /entimice/filesystem/temp -maxdepth 1 -type d -name "jobserver*_jobRunner*" -mmin +1440 -exec mv {} $log_target/jobserver_jobRunner_$day \;


find /entimice/filesystem/temp -maxdepth 1 -type d -name "jobserver*_jobRunner*" -mmin +1440 -exec rm -rf {} \;

