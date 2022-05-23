# Author - Sathis Kumar Raju - sathiskumar.raju@astrazeneca.com
# Description - This script will archive and cleanup entimICE log files

#!/bin/bash

day=`date +%d%m%Y`
ar_file_ai=/SASWORK/housekeeping/archive/archive_CodeSnippet_Output_$day.tar

#find /entimice/filesystem/temp -maxdepth 1 -type f -name "CodeSnippet_Output*" -mtime +1 -exec tar rvf $ar_file_ai {} \;


log_target=/san2/archive_temp_log
day=`date +%d%m%Y`


cd $log_target
ret=$?
if [ "$ret" -ne 0 ]
then
        exit -1
fi

mkdir Export_Inventory_$day
find /entimice/filesystem/temp -maxdepth 1 -type f -name "Export_Inventory_*" -mmin +1440 -exec mv {} $log_target/Export_Inventory_$day \;


find /entimice/filesystem/temp -maxdepth 1 -type f -name "Export_Inventory_*" -mmin +1440 -exec rm -rf {} \;


