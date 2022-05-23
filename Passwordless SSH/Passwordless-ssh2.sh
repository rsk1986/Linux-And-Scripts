server1 ->

ssh-keygen -t rsa

cat /home/kxsb404/.ssh/id_rsa.pub | ssh server1s 'cat >> /home/kxsb404/.ssh/authorized_keys'


