
rsync
========
========

-n, --dry-run               perform a trial run with no changes made


rsync -avpHAX --progress --dry-run /csre_prev/dev_prev /csreprevdev 2> /tmp/csreprevdev.err

rsync -avpxHAX --progress --dry-run /csre_prev/dev_prev /csreprevdev 2> /tmp/csreprevdev.err

-a  : all files, with permissions, etc..
-v  : verbose, mention files
-p, --perms :  preserve permissions
-x, --one-file-system       don’t cross filesystem boundaries
-H  : preserve hard links (not included with -a)
-A  : preserve ACLs/permissions (not included with -a)
-X  : preserve extended attributes (not included with -a)



rsync -avpHAX --progress /home/kxsb404 /tmp/target/ 2> /tmp/er.txt


rsync -avpHAX --progress /SASDATA10/LAAD/bkp /SASARCH/LAAD 2> /tmp/err.txt
nohup rsync -avpHAX --progress /SASDATA10/LAAD/bkp /SASARCH/LAAD 2> /tmp/err.txt & 


[kfwj143@uspllsasgrnprd02 LAAD]$ hostname
uspllsasgrnprd02.americas.astrazeneca.net

[kfwj143@uspllsasgrnprd02 LAAD]$ nohup rsync -avpHAX --progress /SASDATA10/LAAD/bkp /SASARCH/LAAD 2> /tmp/err.txt &
[1] 26737

[kfwj143@uspllsasgrnprd02 LAAD]$ jobs
[1]+  Running                 nohup rsync -avpHAX --progress /SASDATA10/LAAD/bkp /SASARCH/LAAD 2> /tmp/err.txt &

[kfwj143@uspllsasgrnprd02 bkp]$ jobs
[1]+  Running                 nohup rsync -avpHAX --progress /SASDATA10/LAAD/bkp /SASARCH/LAAD 2> /tmp/err.txt &  (wd: /SASARCH/LAAD)

[kfwj143@uspllsasgrnprd02 LAAD]$ ps -ef | grep -i rsync
kfwj143  26737 11373 69 12:47 pts/1    00:00:49 rsync -avpHAX --progress /SASDATA10/LAAD/bkp /SASARCH/LAAD
kfwj143  26738 26737  0 12:47 pts/1    00:00:00 rsync -avpHAX --progress /SASDATA10/LAAD/bkp /SASARCH/LAAD
kfwj143  26739 26738 78 12:47 pts/1    00:00:55 rsync -avpHAX --progress /SASDATA10/LAAD/bkp /SASARCH/LAAD





=====================

$ date; rsync -avpHAX --progress /japan_share/test.dat /SASDATA5/japan_transfer/; date
Wed Jan 30 11:47:17 CET 2019
sending incremental file list
test.dat
  1,073,741,824 100%  223.22kB/s    1:18:17 (xfr#1, to-chk=0/1)

sent 1,074,004,059 bytes  received 35 bytes  228,438.60 bytes/sec
total size is 1,073,741,824  speedup is 1.00
Wed Jan 30 13:05:38 CET 2019



$ date; rsync -avpHAX --progress /SASDATA6/test2.dat /SASDATA5/japan_transfer/; date
Wed Jan 30 13:16:36 CET 2019
sending incremental file list
test2.dat
  1,073,741,824 100%  329.78MB/s    0:00:03 (xfr#1, to-chk=0/1)

sent 1,074,004,072 bytes  received 35 bytes  306,858,316.29 bytes/sec
total size is 1,073,741,824  speedup is 1.00
Wed Jan 30 13:16:39 CET 2019



