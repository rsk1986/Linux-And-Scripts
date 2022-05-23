30 3 * * * /sascommon/utils/lgrot.sh


$ cat /sascommon/utils/lgrot.sh
bzip2 /home/sas/proc.txt

mv /home/sas/proc.txt.bz2 /home/sas/proc/a.txt.bz2.`date +%d"-"%m"-"%Y`

