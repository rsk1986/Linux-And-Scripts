#! /bin/bash

> /entimice/op_r.log
> /entimice/err_r.log

for i in {1..9}
do
        find /entimice/filesystem -type f -exec nfs4_setfacl -x A::icer0"$i"DV@astrazeneca.net:rwatTnNcCy {} \; >> /entimice/op_r.log 2>> /entimice/err_r.log
	find /entimice/filesystem -type f -exec nfs4_setfacl -x A::icer0"$i"DV@astrazeneca.net:rxtncy {} \; >> /entimice/op_r.log 2>> /entimice/err_r.log
done

	find /entimice/filesystem -type f -exec nfs4_setfacl -x A::icer10DV@astrazeneca.net:rwatTnNcCy {} \; >> /entimice/op_r.log 2>> /entimice/err_r.log
	find /entimice/filesystem -type f -exec nfs4_setfacl -x A::icer10DV@astrazeneca.net:rwatTnNcCy {} \; >> /entimice/op_r.log 2>> /entimice/err_r.log

