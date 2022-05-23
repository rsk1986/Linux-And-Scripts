https://stackoverflow.com/questions/4799553/how-to-update-one-file-in-a-zip-archive

[iceadminPD@sesklentfspd01 ~]$ zip c.zip 1.txt 22 222 2.txt
  adding: 1.txt (deflated 45%)
  adding: 22 (deflated 45%)
  adding: 222 (deflated 43%)
  adding: 2.txt (deflated 45%)
[iceadminPD@sesklentfspd01 ~]$
[iceadminPD@sesklentfspd01 ~]$ unzip -l c.zip
Archive:  c.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
   143661  07-22-2020 12:36   1.txt
   143628  07-22-2020 12:37   22
   139830  07-22-2020 12:42   222
   143628  07-22-2020 12:37   2.txt
---------                     -------
   570747                     4 files
[iceadminPD@sesklentfspd01 ~]$
[iceadminPD@sesklentfspd01 ~]$ echo > 1.txt
[iceadminPD@sesklentfspd01 ~]$
[iceadminPD@sesklentfspd01 ~]$ zip c.zip 1.txt
updating: 1.txt (stored 0%)
[iceadminPD@sesklentfspd01 ~]$
[iceadminPD@sesklentfspd01 ~]$ unzip -l c.zip
Archive:  c.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
        1  10-30-2020 18:29   1.txt
   143628  07-22-2020 12:37   22
   139830  07-22-2020 12:42   222
   143628  07-22-2020 12:37   2.txt
---------                     -------
   427087                     4 files
[iceadminPD@sesklentfspd01 ~]$


[iceadminPD@sesklentfspd01 ~]$ mkdir f
[iceadminPD@sesklentfspd01 ~]$ cp c.zip f
[iceadminPD@sesklentfspd01 ~]$ cd f
[iceadminPD@sesklentfspd01 f]$ ll
total 236
-rw-r--r--. 1 iceadminPD icegroupPD 239387 Oct 30 18:31 c.zip
[iceadminPD@sesklentfspd01 f]$ unzip c.zip
Archive:  c.zip
 extracting: 1.txt
  inflating: 22
  inflating: 222
  inflating: 2.txt
[iceadminPD@sesklentfspd01 f]$ ll
total 668
-rw-r--r--. 1 iceadminPD icegroupPD      1 Oct 30 18:29 1.txt
-rw-r--r--. 1 iceadminPD icegroupPD 143628 Jul 22 12:37 22
-rw-r--r--. 1 iceadminPD icegroupPD 139830 Jul 22 12:42 222
-rw-r--r--. 1 iceadminPD icegroupPD 143628 Jul 22 12:37 2.txt
-rw-r--r--. 1 iceadminPD icegroupPD 239387 Oct 30 18:31 c.zip
[iceadminPD@sesklentfspd01 f]$ cat 1.txt

[iceadminPD@sesklentfspd01 f]$
