#! /bin/bash

> /entimice/op_sas.log
> /entimice/err_sas.log

for i in {1..9}
do 
        find /entimice/filesystem/filesysroot/root/zzz_adhoc/proj_vinod -type f -exec nfs4_setfacl -x A::icesas0"$i"DV@astrazeneca.net:rwatTnNcCy {} \; >> /entimice/op_sas.log 2>> /entimice/err_sas.log
done

for i in {10..100}
do
	find /entimice/filesystem/filesysroot/root/zzz_adhoc/proj_vinod -type f -exec nfs4_setfacl -x A::icesas"$i"DV@astrazeneca.net:rwatTnNcCy {} \; >> /entimice/op_sas.log 2>> /entimice/err_sas.log
done

