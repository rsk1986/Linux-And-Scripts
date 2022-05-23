/SASDATA/RWE/USCommercial/S27/datamart_data/production/weekly /SASARCH/RWE/USCommercial/S27/datamart_data/production/weekly/

du -sh /SASDATA/RWE/USCommercial/S27/datamart_data/production/weekly/splitweek_weekly /SASARCH/RWE/USCommercial/S27/datamart_data/production/weekly/splitweek_weekly




nohup rsync -avpHAX --progress  /SASDATA/RWE/USCommercial/S27/datamart_data/production/weekly/splitweek_weekly /SASARCH/RWE/USCommercial/S27/datamart_data/production/weekly/ 2> /tmp/err.txt & 



/SASDATA/RWE/USCommercial/S27/datamart_data/production/weekly /SASARCH/RWE/USCommercial/S27/datamart_data/production/weekly/

du -sh /SASDATA/RWE/USCommercial/S27/datamart_data/production/weekly/weekly_artis /SASARCH/RWE/USCommercial/S27/datamart_data/production/weekly/weekly_artis






nohup rsync -avpHAX --progress  /SASARCH/RWE/USCommercial/S27/datamart_data/production/weekly/weekly_execution /SASDATA/RWE/USCommercial/S27/datamart_data/production/weekly/ 2> /tmp/err6.txt & 
 

=========================


/SASDATA/RWE/USCommercial/S27/datamart_data/production/weekly

rm -rf weekly_rx brilinta_xpo_pd_setup.xls weekly_crestor_apld weekly_crestor_plantrak adhoc.sas weekly_symbicort_plantrak weekly_symbicort_apld weekly_ocs_apld weekly_execution


/SASARCH/RWE/USCommercial/S27/datamart_data/production/weekly

[kfwj143@uspllsasgrnprd04 weekly]$ ls -lrt /SASDATA/RWE/USCommercial/S27/datamart_data/production/weekly
total 288
-rwxrwx---   1 kfwj143 XAZU-NonValidated-SAS-GRID-Prd-USCommDMgr 18944 Mar 20  2015 brilinta_xpo_pd_setup.xls
-rw-rw-r--   1 kfwj143 XAZU-NonValidated-SAS-GRID-Prd-USCommDMgr   248 Feb 14  2017 adhoc.sas



brilinta_xpo_pd_setup.xls - no
adhoc.sas - no

weekly_rx - done
weekly_crestor_apld - done
weekly_crestor_plantrak - done
weekly_symbicort_plantrak - done 
weekly_symbicort_apld - done
weekly_ocs_apld - done
weekly_execution - done



