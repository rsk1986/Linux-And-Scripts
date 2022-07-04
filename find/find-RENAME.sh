[admin@server1 ~]$ find /entimice/filesystem/temp -type f -name 'tmp_cmd_testdata_CR*' -exec ls -l {} \;
-rw-------. 1 iceadminPD icegroupPD 26103 Oct 28 12:12 /entimice/filesystem/temp/tmp_cmd_testdata_CR_Change_Autoversioning_Tune.log
-rw-------. 1 iceadminPD icegroupPD 29147 Oct 28 12:13 /entimice/filesystem/temp/tmp_cmd_testdata_CR200_Tune.log
-rw-------. 1 iceadminPD icegroupPD 31445 Oct 28 12:16 /entimice/filesystem/temp/tmp_cmd_testdata_CR201_Tune.log
-rw-------. 1 iceadminPD icegroupPD 25892 Oct 28 12:22 /entimice/filesystem/temp/tmp_cmd_testdata_CR202_Tune.log
-rw-------. 1 iceadminPD icegroupPD 26112 Oct 28 12:23 /entimice/filesystem/temp/tmp_cmd_testdata_CR203_Tune.log
-rw-------. 1 iceadminPD icegroupPD 27451 Oct 28 12:24 /entimice/filesystem/temp/tmp_cmd_testdata_CR204_Tune.log
-rw-------. 1 iceadminPD icegroupPD 27879 Oct 28 12:25 /entimice/filesystem/temp/tmp_cmd_testdata_CR205_Tune.log
-rw-------. 1 iceadminPD icegroupPD 26128 Oct 28 12:25 /entimice/filesystem/temp/tmp_cmd_testdata_CR206_Tune.log
-rw-------. 1 iceadminPD icegroupPD 137915 Oct 28 12:26 /entimice/filesystem/temp/tmp_cmd_testdata_CR207_Tune.log
-rw-------. 1 iceadminPD icegroupPD 39013 Oct 28 12:27 /entimice/filesystem/temp/tmp_cmd_testdata_CR208_Tune.log
-rw-------. 1 iceadminPD icegroupPD 30428 Nov  2 21:02 /entimice/filesystem/temp/tmp_cmd_testdata_CR151_Tune.log
-rw-------. 1 iceadminPD icegroupPD 27382 Nov  2 21:03 /entimice/filesystem/temp/tmp_cmd_testdata_CR209_Tune.log
[admin@server1 ~]$

[admin@server1 ~]$ find /entimice/filesystem/temp -type f -name 'tmp_cmd_testdata_CR*' -exec mv {} {}.06Nov2020 \;
[admin@server1 ~]$

[admin@server1 ~]$ find /entimice/filesystem/temp -type f -name 'tmp_cmd_testdata_CR*' -exec ls -l {} \;
-rw-------. 1 iceadminPD icegroupPD 29147 Oct 28 12:13 /entimice/filesystem/temp/tmp_cmd_testdata_CR200_Tune.log.06Nov2020
-rw-------. 1 iceadminPD icegroupPD 31445 Oct 28 12:16 /entimice/filesystem/temp/tmp_cmd_testdata_CR201_Tune.log.06Nov2020
-rw-------. 1 iceadminPD icegroupPD 26103 Oct 28 12:12 /entimice/filesystem/temp/tmp_cmd_testdata_CR_Change_Autoversioning_Tune.log.06Nov2020
-rw-------. 1 iceadminPD icegroupPD 25892 Oct 28 12:22 /entimice/filesystem/temp/tmp_cmd_testdata_CR202_Tune.log.06Nov2020
-rw-------. 1 iceadminPD icegroupPD 26112 Oct 28 12:23 /entimice/filesystem/temp/tmp_cmd_testdata_CR203_Tune.log.06Nov2020
-rw-------. 1 iceadminPD icegroupPD 27451 Oct 28 12:24 /entimice/filesystem/temp/tmp_cmd_testdata_CR204_Tune.log.06Nov2020
-rw-------. 1 iceadminPD icegroupPD 27879 Oct 28 12:25 /entimice/filesystem/temp/tmp_cmd_testdata_CR205_Tune.log.06Nov2020
-rw-------. 1 iceadminPD icegroupPD 26128 Oct 28 12:25 /entimice/filesystem/temp/tmp_cmd_testdata_CR206_Tune.log.06Nov2020
-rw-------. 1 iceadminPD icegroupPD 137915 Oct 28 12:26 /entimice/filesystem/temp/tmp_cmd_testdata_CR207_Tune.log.06Nov2020
-rw-------. 1 iceadminPD icegroupPD 39013 Oct 28 12:27 /entimice/filesystem/temp/tmp_cmd_testdata_CR208_Tune.log.06Nov2020
-rw-------. 1 iceadminPD icegroupPD 30428 Nov  2 21:02 /entimice/filesystem/temp/tmp_cmd_testdata_CR151_Tune.log.06Nov2020
-rw-------. 1 iceadminPD icegroupPD 27382 Nov  2 21:03 /entimice/filesystem/temp/tmp_cmd_testdata_CR209_Tune.log.06Nov2020

