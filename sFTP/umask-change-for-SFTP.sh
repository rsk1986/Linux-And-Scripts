Need your help to add the highlighted value in the entry on /etc/ssh/sshd_config and restart sshd service..

# override default of no subsystems
Subsystem       sftp    /usr/libexec/openssh/sftp-server -u 002
