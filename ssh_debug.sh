Debug
========
ssh -v -l user1 server01
ssh -vvv -l user1 server01
   

ssh -E log_file


-F configfile
             Specifies an alternative per-user configuration file.  If a configuration file is given on the command line, the system-wide configuration file (/etc/ssh/ssh_config) will be
             ignored.  The default for the per-user configuration file is ~/.ssh/config.



ssh -F ~/.ssh/config

ssh -F /etc/ssh/ssh_config



 -G      Causes ssh to print its configuration after evaluating Host and Match blocks and exit.



  -i identity_file
             Selects a file from which the identity (private key) for public key authentication is read.  The default is ~/.ssh/identity for protocol version 1, and ~/.ssh/id_dsa,
             ~/.ssh/id_ecdsa, ~/.ssh/id_ed25519 and ~/.ssh/id_rsa for protocol version 2.  Identity files may also be specified on a per-host basis in the configuration file.  It is possible
             to have multiple -i options (and multiple identities specified in configuration files).  If no certificates have been explicitly specified by the CertificateFile directive, ssh
             will also try to load certificate information from the filename obtained by appending -cert.pub to identity filenames.

			 
-Q query_option
             Queries ssh for the algorithms supported for the specified version 2.  The available features are: cipher (supported symmetric ciphers), cipher-auth (supported symmetric ciphers
             that support authenticated encryption), mac (supported message integrity codes), kex (key exchange algorithms), key (key types), key-cert (certificate key types), key-plain (non-
             certificate key types), and protocol-version (supported SSH protocol versions).

			 
ssh may additionally obtain configuration data from a per-user configuration file and a system-wide configuration file.  The file format and configuration options are described in
     ssh_config(5).

	 
StrictHostKeyChecking


	 
