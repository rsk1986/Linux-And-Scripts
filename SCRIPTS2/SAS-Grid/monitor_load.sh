#! /bin/bash

#mail_id=sathiskumar.raju@astrazeneca.com
mail_id=INCHRDISASSUPPORT@astrazeneca.com
hs=$(hostname | awk -F'.' '{print $1 }')

now=`uptime | tr ',' ' ' | awk '{ print $10 }'`
now2=`uptime | tr ',' ' ' | awk '{ print $11 }'`
now3=`uptime | tr ',' ' ' | awk '{ print $12 }'`

#nnow=`printf "%.0f" $now`
#nnow2=`printf "%.0f" $now2`
#nnow3=`printf "%.0f" $now3`

nnow=${now%.*}
nnow2=${now2%.*}
nnow3=${now3%.*}

#nnow=15
#nnow2=16
#nnow3=6

#echo $nnow $nnow2 $nnow3

if [ $nnow -gt 9 -a $nnow2 -gt 9 -a $nnow3 -gt 9 ]
then
echo "=================================================================================" > /tmp/load.temp
echo >> /tmp/load.temp
echo "Server Load is high (>10) for the past 15 mins.. Please check the server immediately.." >> /tmp/load.temp
echo >> /tmp/load.temp
echo "=================================================================================" >> /tmp/load.temp
echo >> /tmp/load.temp
echo "Current Load on `hostname` =>" >> /tmp/load.temp
echo >> /tmp/load.temp
uptime >> /tmp/load.temp
echo >> /tmp/load.temp
echo "=================================================================================" >> /tmp/load.temp

echo >> /tmp/load.temp
date >> /tmp/load.temp
echo >> /tmp/load.temp
echo "" >> /tmp/load.temp
echo "TOP Command Output...." >> /tmp/load.temp
echo "" >> /tmp/load.temp
top -b -n 1  | head -40  >> /tmp/load.temp
echo "" >> /tmp/load.temp
echo "=================================================================================" >> /tmp/load.temp
echo "" >> /tmp/load.temp
echo "PS Command Output => CPU" >> /tmp/load.temp
echo "" >> /tmp/load.temp
ps aux | head -1 >> /tmp/load.temp
ps aux | sort -nrk 3,3 | head -10 >> /tmp/load.temp
echo "" >> /tmp/load.temp
echo "=================================================================================" >> /tmp/load.temp
echo "" >> /tmp/load.temp
echo "PS Command Output => MEMORY" >> /tmp/load.temp
echo "" >> /tmp/load.temp
ps aux | head -1 >> /tmp/load.temp
ps aux --sort -rss  | head -10 >> /tmp/load.temp
echo "" >> /tmp/load.temp
echo "=================================================================================" >> /tmp/load.temp
echo "" >> /tmp/load.temp


mail -s "Load Issue - $hs - US Non-Validated SAS GRID Server" $mail_id < /tmp/load.temp

elif [ $nnow -gt 9 -a $nnow2 -gt 9 ]
then

echo "=================================================================================" > /tmp/load0.temp
echo >> /tmp/load0.temp
echo "Server Load is high (>10) for the past 5 mins.. Please check the server immediately.." >> /tmp/load0.temp
echo >> /tmp/load0.temp
echo "=================================================================================" >> /tmp/load0.temp
echo >> /tmp/load0.temp
echo "Current Load on `hostname` =>" >> /tmp/load0.temp
echo >> /tmp/load0.temp
uptime >> /tmp/load0.temp
echo >> /tmp/load0.temp
echo "=================================================================================" >> /tmp/load0.temp

echo >> /tmp/load0.temp
date >> /tmp/load0.temp
echo >> /tmp/load0.temp
echo "" >> /tmp/load0.temp
echo "TOP Command Output...." >> /tmp/load0.temp
echo "" >> /tmp/load0.temp
top -b -n 1  | head -40  >> /tmp/load0.temp
echo "" >> /tmp/load0.temp
echo "=================================================================================" >> /tmp/load0.temp
echo "" >> /tmp/load0.temp
echo "PS Command Output => " >> /tmp/load0.temp
echo "" >> /tmp/load0.temp
ps aux | head -1 >> /tmp/load0.temp
ps aux | sort -nrk 3,3 | head -20 >> /tmp/load0.temp
echo "" >> /tmp/load0.temp
echo "=================================================================================" >> /tmp/load0.temp
echo "" >> /tmp/load.temp
echo "PS Command Output => MEMORY" >> /tmp/load.temp
echo "" >> /tmp/load.temp
ps aux | head -1 >> /tmp/load.temp
ps aux --sort -rss  | head -10 >> /tmp/load.temp
echo "" >> /tmp/load.temp
echo "=================================================================================" >> /tmp/load.temp
echo "" >> /tmp/load0.temp

mail -s "Load Issue - $hs - US Non-Validated SAS GRID Server" $mail_id < /tmp/load0.temp

else

echo "=================================================================================" > /tmp/load2.temp
echo >> /tmp/load2.temp
uptime >> /tmp/load2.temp
echo >> /tmp/load2.temp
echo "=================================================================================" >> /tmp/load2.temp
echo >> /tmp/load2.temp
echo "Load is normal" >> /tmp/load2.temp
echo >> /tmp/load2.temp
echo "=================================================================================" >> /tmp/load2.temp
#mail -s "Load is Normal - uspllsasgrnprd01 - US Non-Validated SAS GRID Server" $mail_id < /tmp/load2.temp
#mail -s "Load is Normal - uspllsasgrnprd01 - US Non-Validated SAS GRID Server" -r admin sathiskumar.raju@astrazeneca.com < /tmp/load2.temp
fi
