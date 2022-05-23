echo "UserName,UserId,GroupID,Description,Home Directory,Shell"; awk -F':' 'BEGIN{OFS=",";} { print$1,$3,$4,$5,$6, $NF }' /etc/passwd

echo "UserName,UserId,GroupID,Description,Home Directory,Shell"; awk -F':' 'BEGIN{OFS=":";} { print$1,$3,$4,$5,$6, $NF }' /etc/passwd

last kxsb404 | awk '{ print $4,$5,$6,$7}'
last kxsb404 | head -1 | awk '{ print $4,$5,$6,$7}'




grep -w resp /etc/group | sed 's/:/\n/g' | tail -1 | sed 's/,/\n/g' > /tmp/resp_group.txt


while read line; do
	 op=`grep -c $line /etc/passwd`
	 
	if [ $op -eq 0 ]
	then
			echo "The id $line not found"
#	else
#			echo "The id $line is found"
	fi
done < /tmp/userlist_all.csv