# Author - Sathis Kumar Raju - sathiskumar.raju@astrazeneca.com
# Description - This script will monitor the status of filemonitor and send alert mail when file monitor service goes down

#!/bin/bash

if [ -f "$HOME/.filemonitor" ]
then
		exit
fi

cd /entimice/filesystem/temp/log
ret=$?
if [ "$ret" -ne 0 ]
then
        echo "UNABLE to access /entimice/filesystem/temp/log directory... Please Check.. URGENT!" > $HOME/temp.log
        mailx -r "admin@eICEPreprod" -s  "UNABLE to access /entimice/filesystem/temp/log directory... Please Check immediately.." "sathiskumar.raju@astrazeneca.com purushothaman.krishnan@astrazeneca.com Rohit.Sharma2@astrazeneca.com vinod.sivakumar@astrazeneca.com juanpablo.ramirez@astrazeneca.com"  < $HOME/temp.log
        exit -1
fi

js1=`ls -lrt jobserver1*_202* | tail -1 | awk '{ print $9 }'`
js2=`ls -lrt jobserver2*_202* | tail -1 | awk '{ print $9 }'`
c1=`fgrep -c 'File Monitor stopped: AutoImport' $js1`
c2=`fgrep -c 'File Monitor stopped: AutoImport' $js2`

if [ $c1 -gt 0 -o $c2 -gt 0 ]
then
        echo "File monitor stopped... Please Check.. URGENT!" > $HOME/filemonitor.log
	sed -i 's/File Monitor stopped/File Monitor Stopped/g' $js1
	sed -i 's/File Monitor stopped/File Monitor Stopped/g' $js2
	sleep 2        
	#mailx -r "admin@eICEPreprod" -s  "Filemonitor Stopped..... Please Check.. URGENT!" "sathiskumar.raju@astrazeneca.com"  < $HOME/filemonitor.log
        #mailx -r "admin@eICEPreprod" -s  "Filemonitor Stopped..... Please Check immediately.." -c "sathiskumar.raju@astrazeneca.com purushothaman.krishnan@astrazeneca.com Rohit.Sharma2@astrazeneca.com vinod.sivakumar@astrazeneca.com juanpablo.ramirez@astrazeneca.com swetha.vuppalanchi@astrazeneca.com Michael.Forst2@astrazeneca.com abhinav.soti@astrazeneca.com" "nikhil.toraskar@astrazeneca.com alfonso.gonzalez1@astrazeneca.com" < $HOME/filemonitor.log
	/usr/sbin/sendmail -t < /home/iceadminPP/scr/MAIL.txt
	/home/iceadminPP/scr/teams.sh
	touch $HOME/.filemonitor
	exit -2
fi


