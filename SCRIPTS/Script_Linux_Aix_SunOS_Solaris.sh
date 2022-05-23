#! /bin/bash

# Author - Sathis Kumar Raju - sathiskumar.raju@astrazeneca.com
# Description - This script will fetch the details(Owner, Group, Permission for Owner/Group/Other Users & Full Path of the file/directory) of all the files and directories under the given directory/file system on Unix Based Operating Systems.
# The script is tested in Redhat Linux, SunOS, Solaris and AIX
# 
#Syntax
# nohup ./script.sh <<InputDirectoryPath>> <<OutputPath>> <<mail_id>> &
#Example
# nohup ./script.sh /home/kxsb404 /home/kxsb404 sathiskumar.raju@astrazeneca.com & 
#

getfiles()
{
	fs=$1

	if [ -d $fs ]
	then
			find $fs -exec ls -ld {} \; > /tmp/op_$$.txt 2> $2/op_error.txt
	else
			echo "Directory $fs does not exist..." > $2/op_error.txt
	fi

	echo -e "Permission,Owner,Group,Path" > /tmp/op_$$.csv

	awk 'BEGIN{OFS=",";} {print $1,$3,$4,$NF;}' /tmp/op_$$.txt >> /tmp/op_$$.csv

	chmod 666 /tmp/op_$$.txt
	chmod 666 $2/op_error.txt
	chmod 666 /tmp/op_$$.csv
	chmod 666 /tmp/nohup_$$.out

	echo "The script execution is completed..." | mail -s 'File Structure Permission Check Script execution completed' $3
}

format()
{

	for i in {1..11}
	do
		cut -c $i /tmp/op_$$.csv > $i.temp
	done
	
	sed "s/,/ /" 11.temp > 12.temp

	paste -d"," 1.temp 2.temp 3.temp 4.temp 5.temp 6.temp 7.temp 8.temp 9.temp 10.temp 12.temp > first_$$.csv

	
	for i in {1..12}
	do
		rm -f $i.temp
	done

	awk -F',' 'BEGIN{OFS=",";} {print $2,$3,$4}' /tmp/op_$$.csv > second_$$.csv

	touch $2/final_results.csv
	echo "File/Directory,Owner->Read,Owner->Write,Owner->Execute,Group->Read,Group->Write,Group->Execute,Others->Read,Others->Write,Others->Execute,ACL,Owner,Group,Path" > $2/final_results.csv

	sed 1d first_$$.csv > first_1_$$.csv
	sed 1d second_$$.csv > second_1_$$.csv

	
	paste -d',' first_1_$$.csv second_1_$$.csv >> $2/final_results.csv
	rm -f first_$$.csv second_$$.csv first_1_$$.csv second_1_$$.csv
}

main()
{
	getfiles $1 $2 $3 
	format $1 $2 $3
}

main $1 $2 $3



