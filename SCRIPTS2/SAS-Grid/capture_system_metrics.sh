#! /bin/bash

date >> /home/sas/proc.txt
echo "" >> /home/sas/proc.txt
echo "TOP Command Output => CPU & MEMORY" >> /home/sas/proc.txt
echo "" >> /home/sas/proc.txt
top -b -n 1  | head -30  >> /home/sas/proc.txt
echo "" >> /home/sas/proc.txt
top -b -o %MEM | head -30 >> /home/sas/proc.txt
echo "" >> /home/sas/proc.txt
echo "PS Command Output => CPU & MEMORY" >> /home/sas/proc.txt
echo "" >> /home/sas/proc.txt
ps aux | head -1 >> /home/sas/proc.txt
ps aux | sort -nrk 3,3 | head -5 >> /home/sas/proc.txt
echo "" >> /home/sas/proc.txt
echo "" >> /home/sas/proc.txt
#ps aux | head -1 >> /home/sas/proc.txt
ps aux --sort -rss | head -5 >> /home/sas/proc.txt
echo "" >> /home/sas/proc.txt
echo "" >> /home/sas/proc.txt
echo "Free Command Output(GB)" >> /home/sas/proc.txt
echo "" >> /home/sas/proc.txt
free -g >> /home/sas/proc.txt
echo "">> /home/sas/proc.txt
echo "vmstat output (MB)..." >> /home/sas/proc.txt
vmstat -S M 1 5 >> /home/sas/proc.txt
echo "" >> /home/sas/proc.txt
vmstat -a -S M 1 5 >> /home/sas/proc.txt
echo "" >> /home/sas/proc.txt
echo "" >> /home/sas/proc.txt
echo "=================================================================================" >> /home/sas/proc.txt
echo "" >> /home/sas/proc.txt
