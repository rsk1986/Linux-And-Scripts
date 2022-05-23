# Author - Sathis Kumar Raju
# The script will notify the support team and Data Solutions when the sFTP /Open filesystem breaches the threshold

#! /bin/bash

#mail_id=sathiskumar.raju@astrazeneca.com
mail_id=AZentimICEGLOBALSUPPORT@astrazeneca.com

hs=$(hostname | awk -F'.' '{print $1 }')

curr=`df -h /Open | tail -1 | awk '{ print $5}' | sed s'/.$//'`

touch /tmp/monitor_open.tmp

if [ $curr -gt 85 ]
then
        echo "SFTP /Open has breached the threshold and it is currently at $curr on entimICE. Prod Please check immediately!!!" > /tmp/monitor_open.tmp
        echo "" >> /tmp/monitor_open.tmp
        df -h /Open/ >> /tmp/monitor_open.tmp
        #mailx -r "admin@SFTP-entimICEPRD" -s "SFTP /Open File System Running Out-of-Space on entimICE Prod.. Check immediately.." -c "AZentimICEGLOBALSUPPORT@astrazeneca.com" "Datasolutions@astrazeneca.com" < /tmp/monitor_open.tmp
	#mailx -r "admin@SFTP-entimICEPRD" -s "SFTP /Open File System Running Out-of-Space on entimICE Prod.. Check immediately.." -c "sathiskumar.raju@astrazeneca.com" "Rohit.Sharma2@astrazeneca.com vinod.sivakumar@astrazeneca.com" < /tmp/monitor_open.tmp
	cp /home/iceadminPD/scr/MAIL_open.txt /tmp/MAIL_open.txt
	sed -i "s/CURR/$curr/g" /tmp/MAIL_open.txt
	sleep 2
	/usr/sbin/sendmail -t < /tmp/MAIL_open.txt

	#rm /tmp/MAIL_open.txt

fi


