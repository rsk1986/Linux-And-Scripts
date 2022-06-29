http://www.vanemery.com/Linux/ACL/POSIX_ACL_on_Linux.html


[sasowner@server1 test]$ uname -a
Linux USPLLCSREAD01.americas.astrazeneca.net 2.6.32-358.el6.x86_64 #1 SMP Tue Jan 29 11:47:41 EST 2013 x86_64 x86_64 x86_64 GNU/Linux

[sasowner@server1 test]$ ls -ld t
drwxr-xr-x. 2 sasowner 57616 4096 Oct 21 08:44 t

[sasowner@server1 test]$ getfacl t
# file: t
# owner: sasowner
# group: 57616
user::rwx
group::r-x
other::r-x

[sasowner@server1 test]$  setfacl -m u:krhk163:rw t

[sasowner@server1 test]$ ls -ld  t
drwxrwxr-x+ 2 sasowner 57616 4096 Oct 21 08:44 t

[sasowner@server1 test]$ getfacl t
# file: t
# owner: sasowner
# group: 57616
user::rwx
user:krd163:rw-
group::r-x
mask::rwx
other::r-x

