
http://bencane.com/2012/05/27/acl-using-access-control-lists-on-linux/

User Level
==========

setfacl -R -m u:csreadmn:r-x /home/kxsb404

Remove ACL from the given path
setfacl -Rb /home/kxsb404

This command works fine.....
setfacl -R -m u:csreadmn:r-X /home/kxsb404
 execute only if the file is a directory (or) already has execute permission for some user

setfacl -Rd -m u:csreadmn:r-X /home/kxsb404
d for future file inheritance - but not work well


Group Level
============

This command works fine.....
setfacl -R -m g:csreadmn:r-X /home/kxsb404
 execute only if the file is a directory (or) already has execute permission for some user

=========================================================================================================================================================== 
 
#! /bin/bash

fs=/csre
id=kxsb404
mail_id=INCHRDICLIN@astrazeneca.com

host_name=`hostname`
start_time=`date`

setfacl -R -m u:$id:r-X $fs

end_time=`date`

echo "Hostname: $host_name" > /tmp/icmigration.temp
echo "Start Time: $start_time" >> /tmp/icmigration.temp
echo "End Time: $end_time" >> /tmp/icmigration.temp 

end_time=`date`

echo "Hostname: $host_name" > /tmp/icmigration.temp
echo "Start Time: $start_time" >> /tmp/icmigration.temp
echo "End Time: $end_time" >> /tmp/icmigration.temp 

mail -s "CSRE - ACL Permissions for icmigration Account - Script Execution Completed" $mail_id < /tmp/icmigration.temp 

----------------------------------------
#! /bin/bash

fs=/csre
id=kxsb404
mail_id=INCHRDICLIN@astrazeneca.com

host_name=`hostname`
start_time=`date`

find $fs -type d -exec setfacl -m u:$id:r-x {} \;
find $fs -type f -exec setfacl -m u:$id:r-- {} \;

end_time=`date`

echo "Hostname: $host_name" > /tmp/icmigration.temp
echo "Start Time: $start_time" >> /tmp/icmigration.temp
echo "End Time: $end_time" >> /tmp/icmigration.temp 

mail -s "CSRE - ACL Permissions for icmigration Account - Script Execution Completed" $mail_id < /tmp/icmigration.temp 

----------------------------------------
#! /bin/bash

fs=/csre
id=kxsb404
mail_id=INCHRDICLIN@astrazeneca.com

host_name=`hostname`
start_time=`date`

find $fs -type d -ctime -1 -exec setfacl -m u:$id:r-x {} \;
find $fs -type f -ctime -1 -exec setfacl -m u:$id:r-- {} \;

end_time=`date`

echo "Hostname: $host_name" > /tmp/icmigration.temp
echo "Start Time: $start_time" >> /tmp/icmigration.temp
echo "End Time: $end_time" >> /tmp/icmigration.temp 

mail -s "CSRE - ACL Permissions for icmigration Account - Script Execution Completed" $mail_id < /tmp/icmigration.temp 

==================================================================================

find /home/kxsb404 -type d -ctime -1 -exec setfacl -m u:csreadmn:r-x {} \;
find /home/kxsb404 -type f -ctime -1 -exec setfacl -m u:csreadmn:r-- {} \;


find /home/kxsb404 -type f -cmin -5 -exec setfacl -m u:csreadmn:r-- {} \;


find /home/kxsb404 -type f -cmin -5 -exec setfacl -m u:$id:r-- {} \;