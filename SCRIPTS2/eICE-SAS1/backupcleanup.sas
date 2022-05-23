log=/san2/archive_temp_log/
output=/san2/archive_temp_log/backupcleanup.log

echo "==================================================================" >> $output
date >> $output
echo >> $output
echo "****The following backups beyond 30 days are removed****" >> $output
echo >> $output
find $log -maxdepth 1 -type d -mtime +30 -exec ls -ld {} \; >> $output
find $log -maxdepth 1 -type d -mtime +30 -exec rm -rf {} \; >> $output
echo >> $output

