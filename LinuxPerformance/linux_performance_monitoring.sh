https://www.thegeekstuff.com/2011/03/linux-performance-monitoring-intro/

https://www.thegeekstuff.com/2011/03/sar-examples/


sar - collects and displays ALL system activities statistics
iostat - generates CPU, I/O statistics
mpstat - displays CPU statistics
pidstat - reports statistics based on the process id (PID)
nfsiostat - displays NFS I/O statistics
cifsiostat - generates CIFS statistics


1.  CPU Usage of ALL CPUs  (sar -u)
===================================

sar -u Displays CPU usage for the current day that was collected until that point.
sar -u 1 3 Displays real time CPU usage every 1 second for 3 times.
sar -u ALL Same as “sar -u” but displays additional fields.
sar -u ALL 1 3 Same as “sar -u 1 3” but displays additional fields.
sar -u -f /var/log/sa/sa10 Displays CPU usage for the 10day of the month from the sa10 file.

2. CPU Usage of Individual CPU or Core (sar -P)
================================================

sar -P ALL Displays CPU usage broken down by all cores for the current day.
sar -P ALL 1 3 Displays real time CPU usage for ALL cores every 1 second for 3 times (broken down by all cores).
sar -P 1 Displays CPU usage for core number 1 for the current day.
sar -P 1 1 3 Displays real time CPU usage for core number 1, every 1 second for 3 times.
sar -P ALL -f /var/log/sa/sa10 Displays CPU usage broken down by all cores for the 10day day of the month from sa10 file.

mpstat -P ALL

3. Memory Free and Used (sar -r)
=================================

sar -r
sar -r 1 3
sar -r -f /var/log/sa/sa10


4. Swap Space Used (sar -S)
============================

sar -S
sar -S 1 3
sar -S -f /var/log/sa/sa10


5. Overall I/O Activities (sar -b)
============================

sar -b
sar -b 1 3
sar -b -f /var/log/sa/sa10


6. Individual Block Device I/O Activities (sar -d)
===================================================

sar -d 1 1 - To identify the activities by the individual block devices 
sar -p -d 1 1 - The device name (DEV column) can display the actual device name (for example: sda, sda1, sdb1 etc.,), if you use the -p option

7. Display context switch per second (sar -w)
==============================================

sar -w - the total number of processes created per second, and total number of context switches per second
sar -w 1 3
sar -w -f /var/log/sa/sa10


8. Reports run queue and load average (sar -q)
===============================================
sar -q
sar -q 1 3 - reports the run queue size and load average of last 1 minute, 5 minutes, and 15 minutes
sar -q -f /var/log/sa/sa10

[iceadminPD@sesklentsspd04 ~]$ sar -q 1 1
Linux 3.10.0-1160.11.1.el7.x86_64 (sesklentsspd04.astrazeneca.net)      02/20/2021      _x86_64_        (112 CPU)

09:49:55 AM   runq-sz  plist-sz   ldavg-1   ldavg-5  ldavg-15   blocked
09:49:56 AM         0      1276      0.13      0.09      0.06         0
Average:            0      1276      0.13      0.09      0.06         0


[iceadminPD@sesklentsspd04 ~]$ vmstat => (Report virtual memory statistics)
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 1  0      0 1536710400   6512 1612632    0    0     1     0    8    9  0  0 100  0  0

	r: The number of runnable processes (running or waiting for run time).
    b: Number of processes blocked waiting for I/O to complete.


[iceadminPD@sesklentsspd04 ~]$ cat /proc/stat | grep -i procs_running
procs_running 1

Run-queue =>  Number of active ( running ) and queued processes.

Total CPU => [iceadminPD@sesklentfspd01 ~]$ grep 'model name' /proc/cpuinfo | wc -l
112


9. Report network statistics (sar -n)
======================================

sar -n KEYWORD

ALL – This displays all of the below information. The output will be very long.
DEV – Displays network devices vital statistics for eth0, eth1, etc.,
EDEV – Display network device failure statistics
NFS – Displays NFS client activities
NFSD – Displays NFS server activities
SOCK – Displays sockets in use for IPv4
IP – Displays IPv4 network traffic
EIP – Displays IPv4 network errors
ICMP – Displays ICMPv4 network traffic
EICMP – Displays ICMPv4 network errors
TCP – Displays TCPv4 network traffic
ETCP – Displays TCPv4 network errors
UDP – Displays UDPv4 network traffic
SOCK6, IP6, EIP6, ICMP6, UDP6 are for IPv6


sar -n DEV 1 1
sar -n ALL 1 1


10. Report Sar Data Using Start Time (sar -s)
=============================================

When you view historic sar data from the /var/log/sa/saXX file using “sar -f” option, it displays all the sar data for that specific day starting from 12:00 a.m for that day.

Using “-s hh:mi:ss” option, you can specify the start time. For example, if you specify “sar -s 10:00:00”, it will display the sar data starting from 10 a.m (instead of starting from midnight) as shown below.

You can combine -s option with other sar option.

sar -q -f /var/log/sa/sa23 -s 10:00:01


For example, to report the load average on 26th of this month starting from 10 a.m in the morning, combine the -q and -s option as shown below.

sar -q -f /var/log/sa/sa23 -s 10:00:01

There is no option to limit the end-time. You just have to get creative and use head command as shown below.

For example, starting from 10 a.m, if you want to see 7 entries, you have to pipe the above output to “head -n 10”.

sar -q -f /var/log/sa/sa23 -s 10:00:01 | head -n 10


