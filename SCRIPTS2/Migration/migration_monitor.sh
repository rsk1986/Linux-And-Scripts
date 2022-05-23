if [ -f "$HOME/mig.flag" ]
then
                exit -1
fi

c1=`fgrep -c 'Service stopped' /svn_staging_18012021/MIGRATION_FOLDER/migration-service-source.log`


if [ $c1 -gt 0 ]
then
        echo "Data Migration Stopped... Please Check.. URGENT!" > $HOME/mig.log
        echo >> $HOME/mig.log
        echo "Remove the log /home/iceadminPP/mig.flag after resumed the migration..." >> $HOME/mig.log
        mailx -r "admin@eICEPreprod" -s  "Data Migration Stopped..... Please Check.. URGENT!" "sathiskumar.raju@astrazeneca.com Rohit.Sharma2@astrazeneca.com vinod.sivakumar@astrazeneca.com"  < $HOME/mig.log
        touch $HOME/mig.flag
fi
