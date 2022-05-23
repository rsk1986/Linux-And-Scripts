sort by size, in human readable format (within a directory)

ls -lhS 

find large dirs and sort

du -hs * | sort -rh


To find the largest files in a particular location

find . -type f -exec du -Sh {} + | sort -rh | head -n 5
(OR)
find . -type f -printf "%s %p\n" | sort -rn | head -n 5



find . -exec ls -ld {} \; 


ls -lah

Command to output file with date and month
===============================================

echo test > op.`date +%d%b`.output 2> op.`date +%d%b`.error

find large files in filesystem
===============================

ls -lhR . | grep '^-' | sort -k 5 -rn 

for i in SASDATA1 SASDATA2 SASDATA3 SASDATA4 SASDATA5 SASDATA6 SASDATA7 SASDATA8 SASDATA9 SASDATA10 SASDATA11 SASDATA12 SASDATA13 SASDATA14 SASDATARWE
do	
	nohup ls -lhR /$i | grep '^-' | sort -k 5 -rn > $HOME/$i.`date +%d%b`.txt 2> $HOME/$i.`date +%d%b`.error & 
done


for i in tmp test
do
	nohup ls -lR /$i | grep '^-' | sort -k 5 -nr > $HOME/$i.`date +%d%b`.txt 2> $HOME/$i.`date +%d%b`.error & 
done


ls -lhR /SASDATA | grep '^-' | sort -k 5 -rn > SASDATA.`date +%d%b`.txt 2> SASDATA.`date +%d%b`.error
ls -lhR /SASDATA | grep '^-' | sort -k 5 -rn > SASDATA.`date +%d%b`.txt 2> SASDATA.`date +%d%b`.error
ls -lhR /SASDATA | grep '^-' | sort -k 5 -rn > SASDATA.`date +%d%b`.txt 2> SASDATA.`date +%d%b`.error
ls -lhR /SASDATA | grep '^-' | sort -k 5 -rn > SASDATA.`date +%d%b`.txt 2> SASDATA.`date +%d%b`.error
ls -lhR /SASDATA | grep '^-' | sort -k 5 -rn > SASDATA.`date +%d%b`.txt 2> SASDATA.`date +%d%b`.error
ls -lhR /SASDATA | grep '^-' | sort -k 5 -rn > SASDATA.`date +%d%b`.txt 2> SASDATA.`date +%d%b`.error
ls -lhR /SASDATA | grep '^-' | sort -k 5 -rn > SASDATA.`date +%d%b`.txt 2> SASDATA.`date +%d%b`.error
ls -lhR /SASDATA | grep '^-' | sort -k 5 -rn > SASDATA.`date +%d%b`.txt 2> SASDATA.`date +%d%b`.error
ls -lhR /SASDATA | grep '^-' | sort -k 5 -rn > SASDATA.`date +%d%b`.txt 2> SASDATA.`date +%d%b`.error
ls -lhR /SASDATA | grep '^-' | sort -k 5 -rn > SASDATA.`date +%d%b`.txt 2> SASDATA.`date +%d%b`.error




find /home/csreadmn -type f -exec du -Sh {} + | sort -rh
33M     /home/csreadmn/Desktop/CR Toolkit/V2.5.2 Validation/sas94regress/AE2_v250_e4.log
33M     /home/csreadmn/Desktop/CR Toolkit/V2.5.2 Validation/sas93regress/AE2_v250_e4.log
8.5M    /home/csreadmn/Desktop/CR Toolkit/V2.5.2 Validation/sas94regress/demog_v210_sk.log
8.5M    /home/csreadmn/Desktop/CR Toolkit/V2.5.2 Validation/sas93regress/demog_v210_sk.log
4.4M    /home/csreadmn/Desktop/CR Toolkit/V2.5.2 Validation/sas94regress/demog_v200.log


find /home/csreadmn -type f -exec ls -l {} \;
-rw-------. 1 csreadmn csreadmn 51622 Sep 29  2017 /home/csreadmn/.ICEauthority
-rw-------. 1 csreadmn csreadmn 40 Apr 15  2016 /home/csreadmn/.gnupg/trustdb.gpg
-rw-------. 1 csreadmn csreadmn 0 Apr 15  2016 /home/csreadmn/.gnupg/pubring.gpg
-rw-------. 1 csreadmn csreadmn 7856 Apr 15  2016 /home/csreadmn/.gnupg/gpg.conf
-rw-------. 1 csreadmn csreadmn 0 Apr 15  2016 /home/csreadmn/.gnupg/secring.gpg





find /home/csreadmn -type f -exec ls -lh {} \; 
-rw-------. 1 csreadmn csreadmn 51K Sep 29  2017 /home/csreadmn/.ICEauthority
-rw-------. 1 csreadmn csreadmn 40 Apr 15  2016 /home/csreadmn/.gnupg/trustdb.gpg
-rw-------. 1 csreadmn csreadmn 0 Apr 15  2016 /home/csreadmn/.gnupg/pubring.gpg
-rw-------. 1 csreadmn csreadmn 7.7K Apr 15  2016 /home/csreadmn/.gnupg/gpg.conf
-rw-------. 1 csreadmn csreadmn 0 Apr 15  2016 /home/csreadmn/.gnupg/secring.gpg
-rw-rw-r--. 1 csreadmn csreadmn 0 May  2  2016 /home/csreadmn/a.pdf
-rwx------. 1 csreadmn csreadmn 2.9M Jul  6  2017 /home/csreadmn/.gconfd/saved_state
-rw-rw-r--. 1 csreadmn csreadmn 16K Apr 19 09:00 /home/csreadmn/x_daily_backup.log
-rwxr-xr-x. 1 csreadmn csreadmn 12K Mar 25  2015 /home/csreadmn/CSRE_Auto_Monitoring_Round5.sh
-rw-r--r--. 1 csreadmn csreadmn 12K Sep 29  2017 /home/csreadmn/.cache/event-sound-cache.tdb.baee579d3ba2f141d7346e5300000019.x86_64-redhat-linux-gnu
-rw-rw-r--. 1 csreadmn csreadmn 508 Nov 30  2016 /home/csreadmn/.cache/gedit/gedit-metadata.xml


find /csre/dev -type f -exec ls -lh {} \; | awk '$5 ~ /[GM]/'



