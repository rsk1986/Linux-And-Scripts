https://www.thegeekdiary.com/understanding-os-load-average-and-run-queue-blocked-queue-in-terms-of-cpu-utilization-in-linux/

* Reports run queue and load average (sar -q)
===========================================
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



# of cores is important to interpreting load averages ... how do I know how many cores my system has?

cat /proc/cpuinfo to get info on each processor in your system. Note: not available on OSX, Google for alternatives. To get just a count, run it through grep and word count: grep 'model name' /proc/cpuinfo | wc -l

[iceadminPD@sesklentsspd04 ~]$ grep 'model name' /proc/cpuinfo | wc -l
112



* Blocked Process
===================

[iceadminPD@sesklentfspd01 ~]$ vmstat
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 1  0      0 1528796160  70488 9568296    0    0     1     1   17   20  0  0 100  0  0


The second important column which is also being taken by Load Average is ‘b’ state in vmstat which explain blocked state processes – this can be easily interpreted as state-D processes (awaiting for back-end IO to finish – usually Storage Activity). 

If Load average is high and no processes are being actively running and vmstat shows abnormal ‘b’ state value then its time to review SAN performance or verification of any OS component like ISCSI/NFS/NIC/HBA which might experience some issues and lead to serious blocked state under the Linux. For example NFS Server might be busy on CPU level and all client ( Linux ) processes/tasks will be queue-up in state-d ( b ) leading to ‘queueing’ which might then release massive run-queue afterwards – as all processes were waiting for back-end IO to finish later they might again switch into Running leading to massive run-queue which can cause hung/panic state or lead to eviction case afterward.

* Top process > 100% utilization
===============================================

In some cases TOP might show up %CPU value to be greater than 100 this is perfectly fine as TOP command by default in Linux shows single core operations hence in multi-core setups %CPU value can be greater than 100%. For example, If PID utilize 4 cores fully then %CPU value will show 400
 
 In some cases TOP might show up %CPU value to be greater than 100 this is perfectly fine as TOP command by default in Linux shows single core operations hence in multi-core setups %CPU value can be greater than 100%. For example, If PID utilize 4 cores fully then %CPU value will show 400