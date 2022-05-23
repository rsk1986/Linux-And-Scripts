# Author - Sathis Kumar Raju - sathiskumar.raju@astrazeneca.com
# Description - This script will monitor perform the entimICE log files cleanup

#!/bin/bash

fs=fileserver1_202
fs2=fileserver2_202
sas=saspoolmanager1_202
sas2=saspoolmanager2_202
rp1=rpoolmanager1_202
rp2=rpoolmanager2_202
jb1=jobserver1_202
jb1_jr=jobserver1_jobRunner_
jb2=jobserver2_202
jb2_jr=jobserver2_jobRunner_
jb3=jobserver3_202
jb3_jr=jobserver3_jobRunner_
jb4=jobserver4_202
jb4_jr=jobserver4_jobRunner_
jb5=jobserver5_202
jb5_jr=jobserver5_jobRunner_
jb6=jobserver6_202
jb6_jr=jobserver6_jobRunner_
dba1=dbaccessserver1_202
dba2=dbaccessserver2_202
was1=webaccessserver1_202
was2=webaccessserver2_202
was3=webaccessserver3_202
was4=webaccessserver4_202
was5=webaccessserver5_202
was6=webaccessserver6_202
was7=webaccessserver7_202

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
interval=4

cd /entimice/filesystem/temp/log
ret=$?
if [ "$ret" -ne 0 ]
then
        echo "Error during clean-up script execution..." > $log
        echo "UNABLE to access /entimice/filesystem/temp/log directory on `hostname`... Please Check.. URGENT!" >> $log

        mailx -r "admin@eICEProd" -s  "entimICE PROD: CLEAN-UP Script execution failed.. Please Check immediately.." "sathiskumar.raju@astrazeneca.com"  < $log
        #mailx -r "admin@eICEProd" -s  "UNABLE to access /entimice/filesystem/temp/log directory... Please Check immediately.." "sathiskumar.raju@astrazeneca.com purushothaman.krishnan@astrazeneca.com Rohit.Sharma2@astrazeneca.com vinod.sivakumar@astrazeneca.com juanpablo.ramirez@astrazeneca.com rizwan.shaik@astrazeneca.com"  < $log
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

                mailx -r "admin@eICEProd" -s  "entimICE PREPROD: CLEAN-UP Script execution failed.. Please Check immediately.." "sathiskumar.raju@astrazeneca.com"  < $log
                #mailx -r "admin@eICEProd" -s  "UNABLE to access /entimice/filesystem/temp/log directory... Please Check immediately.." "sathiskumar.raju@astrazeneca.com purushothaman.krishnan@astrazeneca.com Rohit.Sharma2@astrazeneca.com vinod.sivakumar@astrazeneca.com juanpablo.ramirez@astrazeneca.com"  < $log
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

                mailx -r "admin@eICEProd" -s  "entimICE PREPROD: CLEAN-UP Script execution failed.. Please Check immediately.." "sathiskumar.raju@astrazeneca.com"  < $ar_log
                #mailx -r "admin@eICEProd" -s  "UNABLE to access /entimice/filesystem/temp/log directory... Please Check immediately.." "sathiskumar.raju@astrazeneca.com purushothaman.krishnan@astrazeneca.com Rohit.Sharma2@astrazeneca.com vinod.sivakumar@astrazeneca.com juanpablo.ramirez@astrazeneca.com rizwan.shaik@astrazeneca.com"  < $ar_log
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
        	archive $fs2 $interval "Fileserver2";   clean $fs2 $interval "Fileserver2";
	archive $sas $interval "SasPoolManager1"; clean $sas $interval "SasPoolManager1";
		archive $sas2 $interval "SasPoolManager2"; clean $sas2 $interval "SasPoolManager2";
        archive $rp1 $interval "RPoolManager1"; clean $rp1 $interval "RPoolManager1";
        archive $rp2 $interval "RPoolManager2"; clean $rp2 $interval "RPoolManager2";
        archive $jb1 $interval "JobServer1"; clean $jb1 $interval "JobServer1";
        archive $jb1_jr $interval "JobServer1-JobRunner"; clean $jb1_jr $interval "JobServer1-JobRunner";
        archive $jb2 $interval "JobServer2"; clean $jb2 $interval "JobServer2";
        archive $jb2_jr $interval "JobServer2-JobRunner";  clean $jb2_jr $interval "JobServer2-JobRunner";
		archive $jb3 $interval "JobServer3"; clean $jb3 $interval "JobServer3";
        archive $jb3_jr $interval "JobServer3-JobRunner";  clean $jb3_jr $interval "JobServer3-JobRunner";
		archive $jb4 $interval "JobServer4"; clean $jb4 $interval "JobServer4";
        archive $jb4_jr $interval "JobServer4-JobRunner";  clean $jb4_jr $interval "JobServer4-JobRunner";
		archive $jb5 $interval "JobServer5"; clean $jb5 $interval "JobServer5";
        archive $jb5_jr $interval "JobServer5-JobRunner";  clean $jb5_jr $interval "JobServer5-JobRunner";
		archive $jb6 $interval "JobServer6"; clean $jb6 $interval "JobServer6";
        archive $jb6_jr $interval "JobServer6-JobRunner";  clean $jb6_jr $interval "JobServer6-JobRunner";
		
        archive $dba1 $interval "DBAccessServer1"; clean $dba1 $interval "DBAccessServer1";
        archive $dba2 $interval "DBAccessServer2"; clean $dba2 $interval "DBAccessServer2";
        archive $was1 $interval "WebAccessServer1"; clean $was1 $interval "WebAccessServer1";
        archive $was2 $interval "WebAccessServer2"; clean $was2 $interval "WebAccessServer2";
		archive $was3 $interval "WebAccessServer3"; clean $was3 $interval "WebAccessServer3";
		archive $was4 $interval "WebAccessServer4"; clean $was4 $interval "WebAccessServer4";
		archive $was5 $interval "WebAccessServer5"; clean $was5 $interval "WebAccessServer5";
		archive $was6 $interval "WebAccessServer6"; clean $was6 $interval "WebAccessServer6";
		archive $was7 $interval "WebAccessServer7"; clean $was7 $interval "WebAccessServer7";
        compress $ar_file
        date >> $op
}

main



      
