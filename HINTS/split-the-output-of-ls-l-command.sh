-r--r--r--+ 1 1315 users 341 Apr  6  2001 /user1/subramaj/.login
-r--r--r--+ 1 1315 users 814 Apr  6  2001 /user1/subramaj/.cshrc
-rw-r--r--+ 1 10524 mqm 168 Sep 26  2013 /user1/kcwv155/local.login
-rw-rw-r--+ 1 watkinse users 64K Jul 29  2003 /user1/watkinse/sasuser/profile.sct01


To get the contents before the filename starts..
=================================================

cut -d'/' -f1 user1_files1.txt > user1_files1_part1.txt

-r--r--r--+ 1 1315 users 341 Apr  6  2001
-r--r--r--+ 1 1315 users 814 Apr  6  2001
-rw-r--r--+ 1 10524 mqm 168 Sep 26  2013
-rw-rw-r--+ 1 watkinse users 64K Jul 29  2003

To get only the filename
====================================

awk -F'/' '{ print $NF }' user1_files1.txt > user1_files1_part2.txt 

.login
.cshrc
local.login
profile.sct01

To get fullpath of the filenames
====================================

cut -d'/' -f2- test.tmp | sed 's/^/\//'

/user1/subramaj/.login
/user1/subramaj/.cshrc
/user1/kcwv155/local.login
/user1/watkinse/sasuser/profile.sct01


To get only the the dirname of the files
=========================================

$ cat /tmp/new/test.tmp2
/user1/subramaj/.login
/user1/watkinse/sasuser/profile.sct01
/user1/watkinse/sas user/pro fi le .sct01
/user1/subramaj/.cshrc


> /tmp/new/test.tmp3

cut -d'/' -f2- $1 | sed 's/^/\//' > tmpfile

 while read -r line
        do

            #echo $line
                dir=$(dirname "$line")
                echo $dir >> /tmp/new/$2

        done < tmpfile



$ cat /tmp/new/test.tmp3
/user1/subramaj
/user1/watkinse/sasuser
/user1/watkinse/sas user
/user1/subramaj
		