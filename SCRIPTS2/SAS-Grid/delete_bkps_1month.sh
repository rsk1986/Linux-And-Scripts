#! /bin/bash

date >> /home/sas/delete_backup.log
echo >> /home/sas/delete_backup.log

for i in /SASARCH /SASARCH1 /SASARCH3 /SASARCH4 /SASARCH5 /SASARCH6
do
        cd $i
        pwd >> /home/sas/delete_backup.log
        #ls -l $i/backups
        #find $i/backups -type d -name 'incr*' -exec ls -ld {} \;
        if [ -d $i/backups ]
        then
                echo "deleting the below 1 month old backups.." >> /home/sas/delete_backup.log
                find $i/backups/ -mtime +30 -type d -name 'incr.201*' -exec ls -ld {} \; >> /home/sas/delete_backup.log
                find $i/backups/ -mtime +30 -type d -name 'incr.201*' -exec rm -rf {} \;
                echo "deletion is complete.." >> /home/sas/delete_backup.log
        else
                echo "Backup folder not present..." >> /home/sas/delete_backup.log
        fi
        echo
done

echo "====================================================================="  >> /home/sas/delete_backup.log
echo >> /home/sas/delete_backup.log
