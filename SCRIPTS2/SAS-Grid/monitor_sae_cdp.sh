#! /bin/bash

sae=`df -h | egrep -i sae | wc -l`
cdp=`df -h | egrep -i cdp | wc -l`

#mail_id=sathiskumar.raju@astrazeneca.com
mail_id=INCHRDISASSUPPORT@astrazeneca.com

#echo $sae
#echo $cdp

if [ $sae -ne 1 -a $cdp -ne 1 ]
then
        echo "The filesystems /SAEReconciliation & /CDPreports are missing on `hostname`. Please check immediately!" > /tmp/sae_cdp.tmp
        mail -s "URGENT: /SAEReconciliation & /CDPreports Fileshare Status" $mail_id < /tmp/sae_cdp.tmp
        exit 1
fi

if [ $sae -ne 1 ]
then
        echo "The filesystems /SAEReconciliation is missing on `hostname`. Please check immediately!" > /tmp/sae_cdp.tmp
        mail -s "URGENT: /SAEReconciliation & /CDPreports Fileshare Status" $mail_id < /tmp/sae_cdp.tmp
        exit 1
fi

if [ $cdp -ne 1 ]
then
        echo "The filesystem /CDPreports is missing on `hostname`. Please check immediately!" > /tmp/sae_cdp.tmp
        mail -s "URGENT: /SAEReconciliation & /CDPreports Fileshare Status" $mail_id < /tmp/sae_cdp.tmp
        exit 1
fi
