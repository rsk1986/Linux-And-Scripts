Servers
========

server1
server2

Debug
========
ssh -v -l sas server1
ssh -v -l sas server2


Steps
=======

ssh-keygen -t rsa

ssh-copy-id -i /home/sas/.ssh/id_rsa.pub sas@server1
ssh-copy-id -i /home/sas/.ssh/id_rsa.pub sas@server2

Other way
==========
cat /home/sas/.ssh/id_rsa.pub | ssh server1 'cat >> /home/sas/.ssh/authorized_keys'
cat /home/sas/.ssh/id_rsa.pub | ssh server2 'cat >> /home/sas/.ssh/authorized_keys'