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


[knkg195@seskalentmwdv02 ~]$ /opt/quest/bin/vastool list user knkg195
EMEA\knkg195:VAS:21564016:1696151674::/home/knkg195:/bin/bash 

knkg195 => Infinity@123


 
