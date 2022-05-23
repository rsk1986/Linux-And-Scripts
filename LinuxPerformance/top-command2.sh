Shift+c => Sort CPU (Default)
Shift+M => Memory
Shift+T => Time
Shift+a => PID

To find all CPUs => 1

==================================

VIRT  --  Virtual Image (kb)
      The  total  amount  of  virtual  memory  used  by the task.  It
      includes all code, data and shared libraries  plus  pages  that
      have  been  swapped out and pages that have been mapped but not
      used.


RES  --  Resident size (kb)
      The non-swapped physical memory a task has used.

SHR  --  Shared Mem size (kb)
      The amount of shared memory used by a task.  It simply reflects
      memory that could be potentially shared with other processes.


S  --  Process Status
      The status of the task which can be one of:
         'D' = uninterruptible sleep
         'R' = running
         'S' = sleeping
         'T' = traced or stopped
         'Z' = zombie


%CPU  --  CPU usage
      The task's share of the elapsed CPU time since the last  screen
      update, expressed as a percentage of total CPU time.  In a true
      SMP environment, if 'Irix mode' is Off,  top  will  operate  in
      'Solaris  mode' where a task's cpu usage will be divided by the
      total number of CPUs.  You toggle 'Irix/Solaris' modes with the
      'I' interactive command.


%MEM  --  Memory usage (RES)
      A task's currently used share of available physical memory.

==================================

Top Command => Shift+I => Irix Mode on/off
============================================

Let say N is the total number of CPUs. 

Then In Irix mode, %CPU is the CPU usage out of N * 100%. 
In Solaris mode,%CPU is the%CPU in Irix mode / N.


