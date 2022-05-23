
scp [options] [[user@]host1:]Sourcepath [[user@]host2:]TargetPath
 
Example:
==========

To copy a file /u01/data/File1.txt from your local server to the /u02/data/ directory on TEST01 remote server. You will be prompted for a password of the username 'infsrvc' on the remote server.

$scp /u01/data/File1.txt infsrvc@TEST01:/u02/data/
Note: infsrvc is the user on TEST01 server.
 
To copy recursively all the files and directories, use the -r option. The following command will copy all the files and subdirectories of /u01/data of the local server DEV01 to a remote UNIX server TEST01 under the directory /u02/data/:

$scp -r /u01/data/ infsrvc@TEST01:/u02/data/ 



Ex:
To copy a folder from one sas server to another

scp -r /sascommon/SAS/SASConfig/WebApp2/Lev1/Web/ sas@uspllsasgrndev01:/tmp/

