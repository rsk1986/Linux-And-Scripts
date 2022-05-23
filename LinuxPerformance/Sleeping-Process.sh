Sleeping Process in Linux

ps h -eo user,pid,s | awk '{ if ($NF == "S" || $NF == "D") { print $0 } }' | sort -k 1
ps h -eo user,pid,s  | wc -l
ps h -eo user,pid,s 

Sleeping Process - Owner Details

ps h -eo user,pid,s | awk '{ if ($NF == "S" || $NF == "D") { print $1 } }' | sort -k 1 | uniq | wc -l


h => to remove the header


You can see if the process is a zombie by using top or the following command:

ps aux | awk '$8=="Z" {print $2}'



=============
http://superuser.com/questions/539920/cant-kill-a-sleeping-process



It might be worth attaching to the process with strace in order to see if it is truly idle or stuck on an IO operation. May provide further clues to the issue perhaps.

strace -pPID

From what I have read there is no way to kill this process other than to reboot. If the process is not consuming any noticeable cpu time, it is unlikely to create any negative impact to the server.

=============

Could it be that it's waiting for a child process? I love ps faux because it'll tell you whether or not there are child processes, and if, which you might need to kill.

ps faux | head -1; ps faux | tail -40

=============

http://unix.stackexchange.com/questions/5642/what-if-kill-9-does-not-work
https://www.digitalocean.com/community/tutorials/how-to-use-ps-kill-and-nice-to-manage-processes-in-linux




