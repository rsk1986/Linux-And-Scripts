https://dbtut.com/index.php/2020/01/20/how-to-export-data-from-sql-plus-to-csv/


$ export ORACLE_HOME=/u001/app/oracle/product/12.2.0/dbhome_1/
$ export PATH=$PATH:/u001/app/oracle/product/12.2.0/dbhome_1/bin/

$ sqlplus MRAZDAREDV/mrazdev_123@SESKLENTOVMDV01.astrazeneca.net:1521/ENTCDV @/tmp/test.sql

test.sql
=========
SET MARKUP CSV ON QUOTE ON

spool /tmp/op.txt

select * from ASSIGNEDMETADATAVALUES  sample(0.0144114563);

spool off

exit;


$ grep ',' op.txt > source.txt

$ grep ',' op.txt | awk -F',' '{ print $1 }' | wc -l > xuid_to_target.txt

$ sqlplus MRAZDAREDV/mrazdev_123@SESKLENTOVMDV01.astrazeneca.net:1521/XXXXXX @/tmp/test_target.sql

test_target.sql
===============

select * from ASSIGNEDMETADATAVALUES where xuid in (<<first_query_output_xuid_list>>);
