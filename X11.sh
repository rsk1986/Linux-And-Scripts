SSH X11 Forwarding - Run GUI Apps Remotely

========================================================

Install X11 - https://www.youtube.com/watch?v=7y-wycTrl0I

1. yum -y install xterm* xorg* 

2. /etc/ssh/sshd_config

=> X11Forwarding yes

3. systemctl restart sshd

4. systemctl statu sshd

5. xclock

=========================================================================================

xming

https://www.youtube.com/watch?v=fS7vqBmxG4w
