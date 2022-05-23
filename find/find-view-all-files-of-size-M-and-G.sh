Find - all files of size M and G
==================================
find /csre/dev -type f -exec ls -lh {} \; | awk '$5 ~ /[GM]/'

Find - all files in size M and exclude the 0M files 
======================================================
find . -type f -exec ls -lh --block-size=M {} \; | awk '$5 != "0M"'


In addition provide full time
========================================================

1894622044	XAZ-DefaultGroup-QAS	790M	Jan	11	16:21	/SASDATA1/users/ktdj417/finalrx.sas7bdat  -> replace all time values( example,16:21) to 2018

find . -type f -exec ls -lh --block-size=M {} \; | awk '$5 != "0M"'

find . -type f -exec ls -lh --block-size=M --full-time {} \; | awk '$5 != "0M"'

find . -type f -exec ls -lh --block-size=M --time-style=long-iso {} \; | awk '$5 != "0M"' 


This command looks good..
find . -type f -exec ls -lh --block-size=M --time-style=long-iso {} \; | awk '$5 != "0M"' | awk '{gsub("-"," ",$6); print}' > kxsb404.txt 2> kxsb404.err

but the below command wont work because it can't parse the filename with whitespaces
find /home/kxsb404 -type f -exec ls -lh --block-size=M --time-style=long-iso {} \; | awk '$5 != "0M"' | awk '{gsub("-"," ",$6); print}' | awk '{ print $3" "$4" "$5" "$8" "$7" "$6" "$NF }' > kxsb404.txt 2> kxsb404.err


Find files from largest to smallest
========================================

find /home/sas/test -type f -exec du -Sh {} + | sort -rh

ls -1Rhs | sed -e "s/^ *//" | grep "^[0-9]" | sort -hr | head -n10

find /home/sas/test -type f -print0 | xargs -0 du -h | sort -rh | head -n 10

find /home/sas/test -type f -exec du -Sh {} + | sort -rh | head -n 10

Alternatively,

Execute this 

nohup find /SASDATA3/USCommercial/Brands/oncology -type f -exec ls -l {} \; > /tmp/op1.txt 2> /tmp/err1.txt &

then

cat op1.txt | sort -k 5 -nr > op1_modified.txt