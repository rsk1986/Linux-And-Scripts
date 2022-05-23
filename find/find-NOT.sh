find $fs1 -type d -ctime -1 -exec chmod g+rx {} \;

find $fs1 -not -name "benra" -type d -ctime -1 -exec chmod g+rx {} \;


find . -type d  -exec ls -ld {} \;
find . -not -name "d3" -type d  -exec ls -ld {} \;

