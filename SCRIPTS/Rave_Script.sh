$ cat script.sh
#! /bin/bash

#folders=`ls -l /home/raveaud/data/ | awk '{ print $9 }'`

dirpath=/home/raveaud/data
temppath=/home/raveaud/file.temp
targroup=users

while true
do

        ls -l $dirpath | sed '1d' > $temppath

        #for folder_rec in `ls -l /home/raveaud/data/ | sed '1d'`
        while read -r line
        do

                name="$line"

                echo $line

                folder=`echo $line | awk '{print $9}'`
                group_name=`ls -ld $dirpath/$folder | awk '{ print $4 }'`
                group_perm=`getfacl $dirpath/$folder | grep -i group:: | awk -F'::' '{ print $2 }'`


                echo $folder " " $group_name " " $group_perm

                ch=`echo $folder | cut -c-1`

                if [ $ch != "D" ]
                then
                        echo "<This is NOT a required folder>"
                        echo "xxxxxxxxxxxxxxxxxxxxxx"
                        echo
                        continue;
                else
                        echo "<This is  a required folder>"
                        echo "......................"
                fi


                if [ $group_name != $targroup ]
                then
                        chgrp $targroup $dirpath/$folder -R
                fi
                if [ $group_perm != "rwx" ]
                then
                        chmod g+rwx $dirpath/$folder -R
                fi

                echo
        done < $temppath
        break;
done
