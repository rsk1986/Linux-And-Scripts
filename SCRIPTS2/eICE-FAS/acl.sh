# Author - Sathis Kumar Raju - sathiskumar.raju@astrazeneca.com
# Description - This script will monitor the ACL threshold breach on setup macro and send alert mail when it breaches

cnt=`nfs_getfacl /entimice/filesystem/filesysroot/root/cdar/common/gmd/prod/macro | wc -l`


if [ $cnt -gt 900 ]
then
        echo "setup macro ACL count has breached the threshold and it is currently at $cnt on entimICE Prod. Please check immediately!!!" > /tmp/monitor_acl.tmp
        echo "" >> /tmp/monitor_acl.tmp
        echo $cnt >> /tmp/monitor_acl.tmp
        cp /home/iceadminPD/scr/MAIL_acl.txt /tmp/MAIL_acl.txt
        /usr/sbin/sendmail -t < /tmp/MAIL_acl.txt

        #rm /tmp/MAIL_acl.txt

fi



