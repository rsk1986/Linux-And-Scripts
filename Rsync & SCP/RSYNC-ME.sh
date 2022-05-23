* RSYNC - parallel execution (by exculding a dir and rsync it separately) and without checksum option

rsync --exclude ZZZ --times --verbose --recursive  --human-readable /entimice/transfer_test_src/root/*  /entimice/transfer_test_trgt/root
rsync --times --verbose --recursive --human-readable /entimice/transfer_test_src/root/ZZZ  /entimice/transfer_test_trgt/root
rsync --exclude ZZZ --times --verbose --recursive  --human-readable /entimice/transfer_test_src/root/*  /entimice/transfer_test_trgt/root
rsync --times --verbose --recursive --human-readable /entimice/transfer_test_src/root/ZZZ  /entimice/transfer_test_trgt/root



NOTE: 

1. ZZZ is a relative directory and it should present under /entimice/transfer_test_src/root/
2. The pair of commands can be executed everytime during incrementals

****************************************************************

****DRY RUN*** 08/JAN/2020

<<<<<<Before this thr is no need to perform chown or chmod as we are performing the rsync as root and target files will be copied as iceadminPD.>>>>>>

rsync from \\10.84.19.149\entimice_ofs_0707\* => exclude cdar
rsync from \\10.84.19.149\entimice_ofs_0707\cdar\* => exclude d419
rsync from \\10.84.19.149\entimice_ofs_0707\cdar\d419

[iceadminPD@sesklentsspd03 ~]$ df -hPT /entimice_robocopy /entimice_rsync /entimice_rsync_source/
Filesystem                                                   Type  Size  Used Avail Use% Mounted on
10.0.9.11:/sesksvm31_nfs_entimice_ofs_dryrun_clone1_08012021 nfs4   24T   14T   11T  58% /entimice_robocopy
10.0.9.11:/sesksvm31_nfs_entimice_ofs_dryrun_clone2_08012021 nfs4   24T   14T   11T  58% /entimice_rsync
10.0.9.11:/sesksvm31_cifs_entimice_ofs_0707_clone1_08012021  nfs4   25T   17T  8.7T  66% /entimice_rsync_source
[iceadminPD@sesklentsspd03 ~]$
[iceadminPD@sesklentsspd03 ~]$


src: /entimice_rsync
cdar: /entimice_rsync_source


nohup rsync --exclude cdar --times --verbose --recursive --human-readable /entimice_rsync_source/* iceadminPD@sesklentsspd03:/entimice_rsync/filesystem/filesysroot/root 2>&1 > /entimice/rsync_testing_exclude_cdar.log &


nohup rsync --exclude d419 --times --verbose --recursive --human-readable /entimice_rsync_source/cdar/* iceadminPD@sesklentsspd03:/entimice_rsync/filesystem/filesysroot/root/cdar 2>&1 > /entimice/rsync_testing_cdar_exclude_d419.log &


nohup rsync --times --verbose --recursive --human-readable /entimice_rsync_source/cdar/d419/* iceadminPD@sesklentsspd03:/entimice_rsync/filesystem/filesysroot/root/cdar/d419 2>&1 > /entimice/rsync_testing_d419.log &



****************************************************************


===========

* RSYNC - parallel execution (by exculding a dir and rsync it separately)

rsync --times --verbose --recursive --checksum --human-readable /entimice/transfer_test_src/root  /entimice/transfer_test_trgt

rsync --exclude ZZZ --times --verbose --recursive --checksum --human-readable /entimice/transfer_test_src/root  /entimice/transfer_test_trgt
rsync --times --verbose --recursive --checksum --human-readable /entimice/transfer_test_src/root/ZZZ  /entimice/transfer_test_trgt/root


===========

* RSYNC - without checksum option

8.7G    d000
7.8G    d069

/entimice/nochecksumtest/src
/entimice/nochecksumtest/trgt

nohup rsync --times --verbose --recursive --checksum --human-readable /entimice/nochecksumtest/src/* /entimice/nochecksumtest/trgt 2>&1 > /entimice/src_checksum_1.log &

nohup rsync --times --verbose --recursive --human-readable /entimice/nochecksumtest/src/* /entimice/nochecksumtest/trgt 2>&1 > /entimice/nochecksum_3.log &

==========

