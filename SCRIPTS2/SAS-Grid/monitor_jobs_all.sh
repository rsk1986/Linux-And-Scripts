#! /bin/sh

rm -f /tmp/monitor_jobs1.tmp /tmp/monitor_jobs2.tmp /tmp/monitor_jobs3.tmp
touch /tmp/monitor_jobs1.tmp /tmp/monitor_jobs2.tmp /tmp/monitor_jobs3.tmp

mail_id=sathiskumar.raju@abc.com
#mail_id=INCHRDISASSUPPORT@abc.com

JOBS=`bjobs -u all | sed 1d | sort | awk '{ print $1}' | xargs`

#echo $JOBS > /tmp/ttt.tmp

echo "**********SAS Enterprise Guide***********" > /tmp/monitor_jobs1.tmp
echo " ">> /tmp/monitor_jobs1.tmp
echo "============================================================================================================================" >> /tmp/monitor_jobs1.tmp
echo " ">> /tmp/monitor_jobs1.tmp
echo -e "Jobid \t\t Jobname \t State \t Queue \t\t Submit_Host \t\t Started_Host \t\t Submit_Time \t\t Session_Type" >> /tmp/monitor_jobs1.tmp
echo >> /tmp/monitor_jobs1.tmp
echo "============================================================================================================================" >> /tmp/monitor_jobs1.tmp
echo >> /tmp/monitor_jobs1.tmp

echo "**********Web Infra Platform Services**********" > /tmp/monitor_jobs2.tmp
echo " " >> /tmp/monitor_jobs2.tmp
echo "============================================================================================================================" >> /tmp/monitor_jobs2.tmp
echo >> /tmp/monitor_jobs2.tmp
echo -e "Jobid \t\t Jobname \t State \t Queue \t\t Submit_Host \t\t Started_Host \t\t Submit_Time \t\t Session_Type" >> /tmp/monitor_jobs2.tmp
echo >> /tmp/monitor_jobs2.tmp
echo "============================================================================================================================" >> /tmp/monitor_jobs2.tmp
echo "" >> /tmp/monitor_jobs2.tmp

echo "**********SASGSUB**********" > /tmp/monitor_jobs3.tmp
echo " " >> /tmp/monitor_jobs3.tmp
echo "============================================================================================================================" >> /tmp/monitor_jobs3.tmp
echo " " >> /tmp/monitor_jobs3.tmp
echo -e "Jobid \t\t Jobname \t State \t Queue \t\t Submit_Host \t\t Started_Host \t\t Submit_Time \t\t Session_Type" >> /tmp/monitor_jobs3.tmp
echo >> /tmp/monitor_jobs3.tmp
echo "============================================================================================================================" >> /tmp/monitor_jobs3.tmp
echo >> /tmp/monitor_jobs3.tmp


for job in $JOBS
do
        jobtp=`/sascommon/SAS/LSFHome/10.1/linux2.6-glibc2.3-x86_64/bin/bjobs -l $job | fgrep 'Job Name'`
        #echo $jobtp
        op1=`echo $jobtp | fgrep 'SAS Enterprise Guide' | wc -l`
        op2=`echo $jobtp | fgrep 'Web Infra Platform Services' | wc -l`
        op3=`echo $jobtp | fgrep 'SASGSUB' | wc -l`

        j1=`/sascommon/SAS/LSFHome/10.1/linux2.6-glibc2.3-x86_64/bin/bjobs -u all | grep $job | awk '{ print $1 }'`
        j2=`/sascommon/SAS/LSFHome/10.1/linux2.6-glibc2.3-x86_64/bin/bjobs -u all | grep $job | awk '{ print $2 }'`
        j3=`/sascommon/SAS/LSFHome/10.1/linux2.6-glibc2.3-x86_64/bin/bjobs -u all | grep $job | awk '{ print $3 }'`
        j4=`/sascommon/SAS/LSFHome/10.1/linux2.6-glibc2.3-x86_64/bin/bjobs -l $job | grep Started | awk '{ print $10}' | sed 's/.emea.*$//' | tr '<' ' '`
        j5=`/sascommon/SAS/LSFHome/10.1/linux2.6-glibc2.3-x86_64/bin/bjobs -l $job| fgrep 'Submitted from host' |  awk '{ print $8 }'  | sed 's/.emea.*$//' | tr '<' ' '`
        j6=`/sascommon/SAS/LSFHome/10.1/linux2.6-glibc2.3-x86_64/bin/bjobs -u all | grep $job | awk '{ print $4 }'`
        j7=`/sascommon/SAS/LSFHome/10.1/linux2.6-glibc2.3-x86_64/bin/bjobs -o submit_time $job |tail -1`

        #echo "jobid jobname State Queue Submit_Host Started_Host"

        jobdate_tmp=`/sascommon/SAS/LSFHome/10.1/linux2.6-glibc2.3-x86_64/bin/bjobs -u all | grep $job | awk '{ print $8" "$9" "$10 }'`
        jobdate=`date -d "$jobdate_tmp" +%j`
        today=`date +%j`
#       echo $jobdate" "$today
        dif=`expr $today - $jobdate`
#       echo $dif

#        if [ $dif -gt 3 ]
#        then
                #echo $today" "$jobdate" "$dif

                if [ $op1 == 1 ]
                then
                        echo -e "$j1 \t $j2 \t $j3 \t $j6 \t $j5 \t $j4 \t $j7 \t SAS Enterprise Guide" >> /tmp/monitor_jobs1.tmp
                elif [ $op2 == 1 ]
                then
                        #echo "$job -> Web Infra Platform Services"
                        echo -e "$j1 \t $j2 \t $j3 \t $j6 \t $j5 \t $j4 \t $j7 \t Web Infra Platform Services" >> /tmp/monitor_jobs2.tmp
                elif [ $op3 == 1 ]
                then
                #echo "$job -> SASGSUB"
                echo -e "$j1 \t $j2 \t $j3 \t $j6 \t $j5 \t $j4 \t $j7 \t SASGSUB" >> /tmp/monitor_jobs3.tmp
                fi
#       fi
done



cp /tmp/monitor_jobs1.tmp /tmp/monitor_jobs.tmp

echo " " >> /tmp/monitor_jobs.tmp
echo " " >> /tmp/monitor_jobs.tmp


cat /tmp/monitor_jobs2.tmp >> /tmp/monitor_jobs.tmp

echo " " >> /tmp/monitor_jobs.tmp
echo " " >> /tmp/monitor_jobs.tmp

cat /tmp/monitor_jobs3.tmp >> /tmp/monitor_jobs.tmp


mail -s "SAS Grid - Val Prod - All Running Jobs" $mail_id < /tmp/monitor_jobs.tmp
