SUID - SGID - Sticky Bit
=======================

http://thegeekdiary.com/what-is-suid-sgid-and-sticky-bit/

http://tecadmin.net/understanding-sticky-bit-suid-and-sgid-in-linux/#


SUID - (Set-user Identification)
=====================================

When a command or script with SUID bit set is run, its effective UID becomes that of the owner of the file, rather than of the user who is running it.

chmod 4*** <file>
chmod u+s <file>

S (Capital S) => suid is set but executable permission is denied

Ex:
 ps -eo pid,euid,ruid
 euid - effective userid
 ruid - real userid
 
 [sas@sesklsasgrnprd01 tmp]$ passwd
 Changing password for user sas.
 Changing password for sas.
 (current) UNIX password:

 [kxsb404@sesklsasgrnprd01 tmp]$ ps -eo pid,euid,ruid | grep 14590
 14590     0 22441  => where 0-effective userid & 22441-realuser id(sas account)


SGID - (Set-group Identification)
=====================================

SGID permission on executable file => SGID permission is similar to the SUID permission, only difference is – when the script or command with SGID on is run, it runs as if it were a member of the same group in which the file is a member.

SGID on a directory => When SGID permission is set on a directory, files created in the directory belong to the group of which the directory is a member.


chmod 2*** <file/dir>
chmod g+s <file/dir>

– If a lowercase letter “s” appears in the group’s execute field, it indicates that the setgid bit is on, and the execute bit for the group is off or denied.


Sticky Bit
===========

– The sticky bit is primarily used on shared directories.

– It is useful for shared directories such as /var/tmp and /tmp because users can create files, read and execute files owned by other users, but are not allowed to remove files owned by other users.

– For example if user bob creates a file named /tmp/bob, other user tom can not delete this file even when the /tmp directory has permission of 777. If sticky bit is not set then tom can delete /tmp/bob, as the /tmp/bob file inherits the parent directory permissions.

chmod 1*** <dir>
chmod +t <dir>

- T refers to when the execute permissions are off.
- t refers to when the execute permissions are on.
