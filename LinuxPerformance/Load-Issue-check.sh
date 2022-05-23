ps aux | sort -nrk 3,3 | head -n 5

watch "ps aux | sort -nrk 3,3 | head -n 5"


ps -Ao user,uid,comm,pid,pcpu,tty --sort=-pcpu | head -n 6

