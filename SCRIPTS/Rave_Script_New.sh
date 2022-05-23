$ cat script.sh
#! /bin/bash

dirpath=/data
targroup=gsautomation

temppath=file.temp
logpath=audit.log


echo "Before permission scipt execution on `date` : " >> $logpath

ls -l $dirpath >> $logpath

        ls -l $dirpath | sed '1d' > $temppath

        while read -r line
        do

                name="$line"


                folder=`echo $line | awk '{print $9}'`
                group_name=`ls -ld $dirpath/$folder | awk '{ print $4 }'`
                group_perm=`getfacl $dirpath/$folder | grep -i group:: | awk -F'::' '{ print $2 }'`


                ch=`echo $folder | cut -c-1`

                if [ $ch != "D" ]
                then
                        continue;
                fi


                if [ $group_name != $targroup ]
                then
                        chgrp $targroup $dirpath/$folder -R
                fi
                if [ $group_perm != "rwx" ]
                then
                        chmod g+rwx $dirpath/$folder -R
                fi

        done < $temppath

echo " " >> $logpath
echo "After permission scipt execution on `date` : " >> $logpath

ls -l $dirpath >> $logpath

echo "=====================================================================" >> $logpath

