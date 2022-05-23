#! /bin/bash

#for i in {1..9}
#do 
#        find /entimice/filesystem/filesysroot/root/zzz_adhoc/test/t123/dm/raw/dev -type f -exec nfs4_setfacl -x A::icesas0"$i"DV@astrazeneca.net:rwatTnNcCy {} \; 2>> /tmp/err.log
#done

#for i in {10..100}
#do
#	find /entimice/filesystem/filesysroot/root/zzz_adhoc/test/t123/dm/raw/dev -type f -exec nfs4_setfacl -x A::icesas"$i"DV@astrazeneca.net:rwatTnNcCy {} \; 2>> /tmp/err.log
#done

find /entimice/filesystem/filesysroot/root/zzz_adhoc/test/t123/dm/raw -type f -exec nfs_getgacl {} \;
