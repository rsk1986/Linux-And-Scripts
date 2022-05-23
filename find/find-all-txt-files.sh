find . -type f -name '*.txt' -exec ls -l {} \;

find . -type f -name '*.txt' -xdev -exec ls -l {} \;



nohup find / -xdev -type f -exec ls -lh {} \; > /tmp/root_files1.txt 2> /tmp/root_error1.txt &
nohup find /home -xdev -type f -exec ls -lh {} \; > /tmp/home_files1.txt 2> /tmp/home_error1.txt &
nohup find /work -xdev -type f -exec ls -lh {} \; > /tmp/work_files1.txt 2> /tmp/work_error1.txt &
nohup find /user1 -xdev -type f -exec ls -lh {} \; > /tmp/user1_files1.txt 2> /tmp/user1_error1.txt &


find . -type f -exec ls -l {} \;









