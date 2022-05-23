# Author - Sathis Kumar Raju - sathiskumar.raju@astrazeneca.com
# Description - This script will monitor perform the entimICE log files cleanup

#!/bin/bash

fs=fileserver1_2020
sas=saspoolmanager1_2020
rp1=rpoolmanager1_2020
rp2=rpoolmanager2_2020
jb1=jobserver1_2020
jb1_jr=jobserver1_jobRunner_
jb2=jobserver2_2020
jb2_jr=jobserver2_jobRunner_
dba1=dbaccessserver1_2020
dba2=dbaccessserver2_2020
was1=webaccessserver1_2020
was2=webaccessserver2_2020

day=`date +%d%m%Y`
#log=$HOME/scr/cleanup/log/temp_$day.log
#ar_log=$HOME/scr/cleanup/log/temp_archival_$day.log
#op=$HOME/scr/cleanup/output/clean_$day.txt
#ar=$HOME/scr/cleanup/output/archive_$day.log
#er=$HOME/scr/cleanup/output/clean_$day.err
#ar_file=$HOME/scr/cleanup/archive/archival_$day.tar
log=/entimice/housekeeping/log/temp_$day.log
ar_log=/entimice/housekeeping/log/temp_archival_$day.log
op=/entimice/housekeeping/output/clean_$day.txt
ar=/entimice/housekeeping/output/archive_$day.log
er=/entimice/housekeeping/output/clean_$day.err
ar_file=/entimice/housekeeping/archive/archival_$day.tar
interval=30

cd /entimice/filesystem/temp/log
ret=$?
if [ "$ret" -ne 0 ]
then
	echo "Error during clean-up script execution..." > $log
        echo "UNABLE to access /entimice/filesystem/temp/log directory on `hostname`... Please Check.. URGENT!" >> $log

        mailx -r "admin@eICEPreprod" -s  "entimICE PREPROD: CLEAN-UP Script execution failed.. Please Check immediately.." "sathiskumar.raju@astrazeneca.com"  < $log
	#mailx -r "admin@eICEPreprod" -s  "UNABLE to access /entimice/filesystem/temp/log directory... Please Check immediately.." "sathiskumar.raju@astrazeneca.com purushothaman.krishnan@astrazeneca.com Rohit.Sharma2@astrazeneca.com vinod.sivakumar@astrazeneca.com juanpablo.ramirez@astrazeneca.com"  < $log
        exit -1
fi

clean()
{
	file=$1
	dy=$2
	type=$3
	echo "file : $file"
	echo "days : $dy"
	echo "File Type : $type"
	date >> $op
	echo "================================================================================" >> $op
	echo "$type - cleanup started..." >> $op
	echo "================================================================================" >> $op
	find /entimice/filesystem/temp/log -maxdepth 1 -mtime +$dy -type f -name "$file*.log" -exec ls  -ld {} \; >> $op 
	find /entimice/filesystem/temp/log -maxdepth 1 -mtime +$dy -type f -name "$file*.log" -exec rm -f {} \;
	ret=$?
	if [ "$ret" -ne 0 ]
	then
		echo "Error during clean-up script execution..." > $log
		echo "Execution failed during the removal of $type log files on `hostname`... Please Check.. URGENT!" >> $log

	        mailx -r "admin@eICEPreprod" -s  "entimICE PREPROD: CLEAN-UP Script execution failed.. Please Check immediately.." "sathiskumar.raju@astrazeneca.com"  < $log
        	#mailx -r "admin@eICEPreprod" -s  "UNABLE to access /entimice/filesystem/temp/log directory... Please Check immediately.." "sathiskumar.raju@astrazeneca.com purushothaman.krishnan@astrazeneca.com Rohit.Sharma2@astrazeneca.com vinod.sivakumar@astrazeneca.com juanpablo.ramirez@astrazeneca.com"  < $log
        	exit -2
	fi
	echo "================================================================================" >> $op
        echo "$type - cleanup ended..." >> $op
        echo "================================================================================" >> $op

}

archive()
{
	file=$1
        dy=$2
        type=$3
        echo "file : $file"
        echo "days : $dy"
        echo "File Type : $type"
        date >> $ar
        echo "================================================================================" >> $ar
        echo "$type - archival started..." >> $ar
        echo "================================================================================" >> $ar
        find /entimice/filesystem/temp/log -maxdepth 1 -mtime +$dy -type f -name "$file*.log" -exec ls  -ld {} \; >> $ar
        find /entimice/filesystem/temp/log -maxdepth 1 -mtime +$dy -type f -name "$file*.log" -exec tar rvf $ar_file {} \;
        ret=$?
        if [ "$ret" -ne 0 ]
        then
                echo "Error during clean-up script execution..." > $ar_log
                echo "Execution failed during the archival pf $type log files on `hostname`... Please Check.. URGENT!" >> $ar_log

                mailx -r "admin@eICEPreprod" -s  "entimICE PREPROD: CLEAN-UP Script execution failed.. Please Check immediately.." "sathiskumar.raju@astrazeneca.com"  < $ar_log
                #mailx -r "admin@eICEPreprod" -s  "UNABLE to access /entimice/filesystem/temp/log directory... Please Check immediately.." "sathiskumar.raju@astrazeneca.com purushothaman.krishnan@astrazeneca.com Rohit.Sharma2@astrazeneca.com vinod.sivakumar@astrazeneca.com juanpablo.ramirez@astrazeneca.com"  < $ar_log
                exit -2
        fi
        echo "================================================================================" >> $ar
        echo "$type - archival ended..." >> $ar
        echo "================================================================================" >> $ar

}

compress()
{
	arc=$1
	bzip2 $arc
}

main()
{
	date > $op
	cat $op
	> $op
        archive $fs $interval "Fileserver1";   clean $fs $interval "Fileserver1";
        archive $sas $interval "SasPoolManager1"; clean $sas $interval "SasPoolManager1";
        archive $rp1 $interval "RPoolManager1"; clean $rp1 $interval "RPoolManager1";
        archive $rp2 $interval "RPoolManager2"; clean $rp2 $interval "RPoolManager2";
        archive $jb1 $interval "JobServer1"; clean $jb1 $interval "JobServer1";
        archive $jb1_jr $interval "JobServer1-JobRunner"; clean $jb1_jr $interval "JobServer1-JobRunner";
        archive $jb2 $interval "JobServer2"; clean $jb2 $interval "JobServer2";
        archive $jb2_jr $interval "JobServer2-JobRunner";  clean $jb2_jr $interval "JobServer2-JobRunner";
        archive $dba1 $interval "DBAccessServer1"; clean $dba1 $interval "DBAccessServer1";
        archive $dba2 $interval "DBAccessServer2"; clean $dba2 $interval "DBAccessServer2";
        archive $was1 $interval "WebAccessServer1"; clean $was1 $interval "WebAccessServer1";
        archive $was2 $interval "WebAccessServer2"; clean $was2 $interval "WebAccessServer2";	
	compress $ar_file
	date >> $op
}

main
