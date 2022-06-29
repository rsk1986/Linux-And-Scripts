#Subsystem sftp /usr/libexec/openssh/sftp-server
Subsystem sftp  internal-sftp

   Match Group ASTRAZENECA\icegroupG
   ChrootDirectory /entice/
   ForceCommand internal-sftp
   X11Forwarding no
   AllowTcpForwarding no
 
 
Match Group domain?users 
Match Group astrazeneca\icegroupg 


https://www.tecmint.com/restrict-sftp-user-home-directories-using-chroot/ 


[user@server1 ~]$ /opt/quest/bin/vastool list user knkg123
EMEA\knkg123:VAS:21434306:1696151674::/home/knkg123:/bin/bash 



 
