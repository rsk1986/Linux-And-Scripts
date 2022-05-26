mailx
======

mailx -r "admin@Server" -s  "Hello..." -c "sathiskumar.raju@test.com" "kumar@test.com" < test.log

===================================================================================================================================================

sendmail
========

$ cat test
From: admin@eICEPreprod
To: sathiskumar.raju@test.com, , sathiskumar.raju@test.com
CC: admin@Server, sathiskumar.raju@test.com
Subject: Welcome!!!
Content-Type: text/plain
X-Priority: 1 (Highest)
X-MSMail-Priority: High

Hello...!

$ /usr/sbin/sendmail -t < test
$ mailq
Mail queue is empty

===================================================================================================================================================
===
