Wget 
========
wget url
wget -O file.zip url

Curl
========
curl -O url
curl --remote-name file.zip url
(or)
curl -o file.zip url

SCP
========
Built-in with SSH command there is SCP command. SCP is used to copy file(s) between servers in secure way.

scp source_file_path destination_file_path
scp source_file_name username@destination_host:destination_folder

scp my_local_file.txt user@remote_host.com:/some/remote/directory
scp local.pdf mrarianto@202.x.x.x:.
 => Sent local.pdf to remote path
 
scp foo.txt bar.txt username@remotehost:/path/directory/
 => Send multiple files to the remote host 

scp -p local.pdf mrarianto@202.x.x.x:.  
 => modification times, access times, and modes

scp -r local_documents mrarianto@202.x.x.x:.
 => recursively copy the files in the documents directory to remote


scp user@remote_host.com:/some/remote/directory ~/my_local_file.txt
 => Download file from remote host
 
 
rsync -> remote sync -> uses SSH protocol
====== 

If you have to copy a large number of files, or have large files, rsync over ssh will be much faster than scp. scp provides a cp like method to copy files from one machine to a remote machine over a secure SSH connection. 

rsync /var/lib/rpm/localfile.txt /root/temp/
 => Copy only one file

rsync -r /var/opt/installation/inventory/ /root/temp
 => Synchronize Two Directories in a Local Server -> recursively 
 
rsync -a /var/opt/installation/inventory/ /root/temp/ 
 => Preserve permissions, recursive, owener details
  
rsync -az /root/temp/ thegeekstuff@192.168.200.10:/home/thegeekstuff/temp/
 =>  copy to remote location with compression (z)
 
rsync -az thegeekstuff@192.168.200.10:/var/lib/rpm /root/temp
 => Vice versa

 