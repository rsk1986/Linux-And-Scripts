[admin@server1 ~]$ cat macroPattern.txt
%ae1
%ae2
%ae3
%calcdiffs
%copyr
%crdef
%demog
%disp1
%dosefmt
%fmtexist
%formatm
%ft_text
%graph1
%graph2
%graph3
%graph4
%label1
%med1
%med2
%med3
%nlabel
%nobs
%norep
%output
%print1
%prognam
%reqparm
%review
%shift1
%stparse
%table2
%table3
%table4
%table5


find a lot of pattern search in tree structure:

date; find /entimice/filesystem/filesysroot/root/cdar -type f -name \*.[Ss][Aa][Ss] -exec egrep -HiE -f $HOME/macroPattern.txt {} \; > $HOME/files.txt ; date

find all sas files in the tree structure

date; find /entimice/filesystem/filesysroot/root/cdar -type f -name \*.[Ss][Aa][Ss] |wc ; date
