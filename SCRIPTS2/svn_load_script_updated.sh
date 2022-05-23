#!/bin/bash
for dump in $(cat sortedfiles.txt);
do
    log=$(echo $dump | cut -d "/" -f 6 | cut -d "_" -f 2 | cut -d "." -f 1)
    svnadmin load /entimice_svn_data/Appdata/entimo/svn18/icare < $dump > /entimice_svn_data/logs/svnload_$log.log 2>&1
        ret=$?

        if [ $ret -ne 0 ]
        then
                echo "Getting error code during dump load $dump... Stopping the execution..." > email.txt

                mailx -r "admin@FAS-PRDServer" -s "return code not 0" "Rohit.Sharma2@astrazeneca.com" "sathiskumar.raju@astrazeneca.com" "vinod.sivakumar@astrazeneca.com"  < email.txt

                exit -1
        fi

done
