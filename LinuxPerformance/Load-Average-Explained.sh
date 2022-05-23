https://scoutapm.com/blog/understanding-load-averages#:~:text=In%20practice%2C%20many%20sysadmins%20will,%22%20Rule%20of%20Thumb%3A%201.00.

http://www.brendangregg.com/blog/2017-08-08/linux-load-averages.html

https://en.wikipedia.org/wiki/Load_(computing)


=====

# of cores is important to interpreting load averages ... how do I know how many cores my system has?

cat /proc/cpuinfo to get info on each processor in your system. Note: not available on OSX, Google for alternatives. To get just a count, run it through grep and word count: grep 'model name' /proc/cpuinfo | wc -l

[iceadminPD@sesklentsspd04 ~]$ grep 'model name' /proc/cpuinfo | wc -l
112


=====

When Linux load averages increase, you know you have higher demand for resources (CPUs, disks, and some locks), but you aren't sure which. You can use other metrics for clarification. For example, for CPUs:

per-CPU utilization: eg, using mpstat -P ALL 1
per-process CPU utilization: eg, top, pidstat 1, etc.
per-thread run queue (scheduler) latency: eg, in /proc/PID/schedstats, delaystats, perf sched
CPU run queue latency: eg, in /proc/schedstat, perf sched, my runqlat bcc tool.
CPU run queue length: eg, using vmstat 1 and the 'r' column, or my runqlen bcc tool.