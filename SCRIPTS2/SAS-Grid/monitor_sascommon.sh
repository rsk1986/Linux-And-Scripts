#! /bin/bash

#mail_id=sathiskumar.raju@abc.com
mail_id=INCHRDISASSUPPORT@abc.com
hs=$(hostname | awk -F'.' '{print $1 }')

curr=`df -h /sascommon | tail -1 | awk '{ print $5}' | sed s'/.$//'`

touch /tmp/monitor_sascommon.tmp

if [ $curr -gt 80 ]
then
        echo "/sascommon File System Utilization has breached the threshold and it is currently at $curr. Please check immediately!!!" > /tmp/monitor_sascommon.tmp
        echo "" >> /tmp/monitor_sascommon.tmp
        df -h /sascommon/ >> /tmp/monitor_sascommon.tmp
        mail -s "URGENT: VAL PROD - /sascommon File System Running Out-of-Space" $mail_id < /tmp/monitor_sascommon.tmp
fi
