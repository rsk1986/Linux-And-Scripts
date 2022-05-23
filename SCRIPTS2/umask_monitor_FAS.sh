> /home/kxsb404/email.txt

while [ true ]
do
        sleep 1

        if [ ! -f "/home/kxsb404/flag.tmp" ]
        then

                         ps=`ps -ef | grep -i fileserver1 | grep -v grep | awk '{ print $2 }'`

                         ret=`grep Umask /proc/$ps/status`

                         ret2=`echo $ret | awk '{ print $2 }'`

                         if [ $ret2 -eq "0000" ]
                                        then
                                        echo "Incorrect umask 0000 on FAS Server.. Check immediately.." >> /home/kxsb404/email.txt
                                        echo >> /home/kxsb404/email.txt
                                        echo $ret >> /home/kxsb404/email.txt
                                        echo >> /home/kxsb404/email.txt
                                        ps -ef | grep -i fileserver1 | grep -v grep >> /home/kxsb404/email.txt

                                        mailx -r "admin@FAS-DEVServer" -s "Incorrect umask 0000 on File Server.. Check immediately.." "sathiskumar.raju@astrazeneca.com" "vinod.sivakumar@astrazeneca.com" "Rohit.Sharma2@astrazeneca.com" < /home/kxsb404/email.txt
                                        touch "/home/kxsb404/flag.tmp"
                        fi
        fi
done
