Issue the command:

nmon -f -T -N -s 60 -c 180

This background a detached nmon process which will record data to a file of the form:

servername_date_time.nmon

Once the nmon process end collect the .nmon files for review.


