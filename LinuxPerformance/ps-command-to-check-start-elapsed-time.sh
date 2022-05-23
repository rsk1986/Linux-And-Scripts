ps normal command
==================

$ ps -ef | head -1;ps -ef | grep 23356
UID        PID  PPID  C STIME TTY          TIME CMD
sas       3906 12976  0 08:35 pts/3    00:00:00 grep --color=auto 23356
kfwj143  23356 23139 95 06:09 ?        02:18:47 /sascommon/SAS/SASHome/SASFoundation/9.4/sasexe/sas -logconfigloc /sascommon/SAS/SASConfig/Grid1/Lev1/SASApp/GridServer/logconfig.apm.batch.xml -noterminal -sasuser work -sysin /sascommon/Gridwork/kfwj143/SASGSUB-2018-10-31_06.09.35.427_USCOM:weekly-weekly_onc_ptd:onc_solid_ptd_load_wk1/onc_solid_ptd_load_wk1.sas -LOG /sascommon/Gridwork/kfwj143/SASGSUB-2018-10-31_06.09.35.427_USCOM:weekly-weekly_onc_ptd:onc_solid_ptd_load_wk1/onc_solid_ptd_load_wk1.log -PRINT /sascommon/Gridwork/kfwj143/SASGSUB-2018-10-31_06.09.35.427_USCOM:weekly-weekly_onc_ptd:onc_solid_ptd_load_wk1/onc_solid_ptd_load_wk1.lst -set GRIDWORK /sascommon/Gridwork/kfwj143/SASGSUB-2018-10-31_06.09.35.427_USCOM:weekly-weekly_onc_ptd:onc_solid_ptd_load_wk1 -autoexec /SASDATA/USCommercial/S27/usercore/default_dev.sas -altlog /SASDATA/USCommercial/S27/datamart_data/production/weekly/weekly_onc_ptd/wk_20181018/log_list/onc_solid_ptd_load_wk1.log -print /SASDATA/USCommercial/S27/datamart_data/production/weekly/weekly_onc_ptd/wk_20181018/log_list/onc_solid_ptd_load_wk1.lst
root     23443 23356  0 06:09 ?        00:00:00 sasels  7 4 8 2 f9862


ps with options to find start/elpased time 
============================================

$ ps -p 23356 -o user,pid,comm,lstart,etime,time,args
USER       PID COMMAND                          STARTED     ELAPSED     TIME COMMAND
kfwj143  23356 sas             Wed Oct 31 06:09:36 2018    02:50:15 02:43:29 /sascommon/SAS/SASHome/SASFoundation/9.4/sasexe/sas -logconfigloc /sascommon/SAS/SASConfig

$ ps -eo pid,ppid,user,cmd
 PID  PPID USER     CMD
    1     0 root     /usr/lib/systemd/systemd --switched-root --system --deserialize 22
    2     0 root     [kthreadd]

ps sort - CPU
================

ps aux | sort -n -k 3 | head -5
ps aux --sort=-pcpu | head -5
ps aux --sort -pcpu | head -5

ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head


ps sort - memory
===================

ps aux --sort=-pmem | head -5 

ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head


ps sort - starttime
===================

ps -ef --sort=start_time


ps sort - cputime
===================

ps -aux --sort -time | head



Check execution time of a process
=======================================

ps -eo comm,etime,user | grep httpd


print process tree
=====================

ps -e --forest 
ps -f --forest -C sshd
ps -ef --forest | grep -v grep | grep sshd

pstree -u sas
pstree -ug sas
pstree -pugsln sas



CHECK
========

https://www.thegeekstuff.com/2011/03/sar-examples/?utm_source=feedburner

iostat generates CPU, I/O statistics

nfsiostat displays NFS I/O statistics.

pidstat reports statistics based on the process id (PID)
pidstat | head -3; ps -ef | grep -i sbatchd



