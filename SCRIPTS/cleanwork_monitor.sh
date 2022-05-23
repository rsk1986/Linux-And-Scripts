/home/csreadmn>cat /home/csreadmn/cleanwork_monitor.sh
#! /bin/bash

#BEFORE CLEANWORK EXECUTION

echo "=========================================================" > /home/csreadmn/cleanwork_monitor.txt
echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
echo "BEFORE CLEANWORK EXECUTION" >> /home/csreadmn/cleanwork_monitor.txt
echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
date >> /home/csreadmn/cleanwork_monitor.txt
echo "" >> /home/csreadmn/cleanwork_monitor.txt

echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
echo "/SASWORK filesystem utilization before cleanwork execution.." >> /home/csreadmn/cleanwork_monitor.txt
echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
df -h /SASWORK >> /home/csreadmn/cleanwork_monitor.txt
echo "" >> /home/csreadmn/cleanwork_monitor.txt

echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
echo "Number of directories before deletion..." >> /home/csreadmn/cleanwork_monitor.txt
echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
ls -lrt /SASWORK | wc -l >> /home/csreadmn/cleanwork_monitor.txt
echo "" >> /home/csreadmn/cleanwork_monitor.txt


echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
echo "/SASWORK directories before cleanwork execution..." >> /home/csreadmn/cleanwork_monitor.txt
echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
echo "" >> /home/csreadmn/cleanwork_monitor.txt

ls -lrt /SASWORK >> /home/csreadmn/cleanwork_monitor.txt

echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
echo "" >> /home/csreadmn/cleanwork_monitor.txt


sleep 300

#CLEANWORK EXECUTION
sudo /am/sas94/SASFoundation/9.4/utilities/bin/cleanwork /SASWORK
i=$?

if [ "$i" -ne 0 ]
then
        echo "CLEANWORK Script Execution Failed.. Please Check.. URGENT!" > /home/csreadmn/cleanwork_monitor.txt
        mail -s "Cleanwork Script execution Failed - Exit Code $i" INCHRDICLIN@astrazeneca.com < /home/csreadmn/cleanwork_monitor.txt
        exit
fi

sleep 300

#AFTER CLEANWORK EXECUTION

echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
echo "AFTER CLEANWORK EXECUTION" >> /home/csreadmn/cleanwork_monitor.txt
echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
date >> /home/csreadmn/cleanwork_monitor.txt
echo "" >> /home/csreadmn/cleanwork_monitor.txt

echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
echo "/SASWORK filesystem utilization after cleanwork execution.." >> /home/csreadmn/cleanwork_monitor.txt
echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
df -h /SASWORK >> /home/csreadmn/cleanwork_monitor.txt
echo "" >> /home/csreadmn/cleanwork_monitor.txt

echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
echo "Number of directories after deletion..." >> /home/csreadmn/cleanwork_monitor.txt
echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
ls -lrt /SASWORK | wc -l >> /home/csreadmn/cleanwork_monitor.txt
echo "" >> /home/csreadmn/cleanwork_monitor.txt

echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
echo "/SASWORK directories after cleanwork execution..." >> /home/csreadmn/cleanwork_monitor.txt
echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt
echo "" >> /home/csreadmn/cleanwork_monitor.txt

ls -lrt /SASWORK >> /home/csreadmn/cleanwork_monitor.txt

echo "=========================================================" >> /home/csreadmn/cleanwork_monitor.txt

echo "" >> /home/csreadmn/cleanwork_monitor.txt


mail -s "Cleanwork Script execution - completed successfully" INCHRDICLIN@astrazeneca.com < /home/csreadmn/cleanwork_monitor.txt

