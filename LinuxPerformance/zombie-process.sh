Remember the definition of zombie process? It is a process that has stopped execution except its entry in process table of Linux operating system (and thus consuming little system resources, if the number of such process is small).


On Unix operating systems, a zombie process or defunct process is a process that has completed execution but still has an entry in the process table, allowing the process that started it to read its exit status. It almost always means that the parent is still around. If the parent exited, the child would be orphaned and re-parented to init, which would immediately perform the wait(). In other words, they should go away once the parent process is done.
A zombie process doesn’t react to signals.



To get the defunct (or) Zombie Process
=======================================

ps aux |grep "defunct"
(or)
ps aux |grep Z
(or)
ps aux | awk '{ print $8 " " $2 }' | grep -w Z



