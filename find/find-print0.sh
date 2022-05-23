find . -name '*txt' | xargs  ls -l
find . -name '*txt' -print0 | xargs -0 -I ls -l
find . -name '*txt' -exec ls {} \;


======================================================
/home/kxsb404/rsync/src>ls -R
.:
dir1  dir3  file1.txt  file2.txt  filex dot txt

./dir1:
dir2

./dir1/dir2:
file3.txt

./dir3:
======================================================


find command - incorrect output....
======================================================
/home/kxsb404/rsync/src>find . -name '*txt' | xargs ls -l
ls: cannot access ./filex: No such file or directory
ls: cannot access dot: No such file or directory
ls: cannot access txt: No such file or directory
-rw-r--r-- 1 kxsb404 users 0 Mar 29 12:12 ./dir1/dir2/file3.txt
-rw-r--r-- 1 kxsb404 users 0 Mar 29 12:11 ./file1.txt
-rw-r--r-- 1 kxsb404 users 0 Mar 29 12:11 ./file2.txt
======================================================


find command with print0 - correct output....
======================================================
/home/kxsb404/rsync/src>find . -name '*txt' -print0 | xargs -0 -I ls -l
./filex dot txt
./file2.txt
./file1.txt
./dir1/dir2/file3.txt
======================================================


find command with exec - correct output....
======================================================
/home/kxsb404/rsync/src>find . -name '*txt' -exec ls {} \;
./filex dot txt
./file2.txt
./file1.txt
./dir1/dir2/file3.txt
======================================================


