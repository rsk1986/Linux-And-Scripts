man zip

option => -u     update  existing  files  and  create new ones if needed.  This option performs the same function as the -f option, extracting (with query)
              files that are newer than those with the same name on disk, and in addition it extracts those files that do not  already  exist  on  disk.
              See -f above for information on setting the timezone properly.

			  
modifier =>   -o     overwrite existing files without prompting.  This is a dangerous option, so use it with care.  (It is often used with -f, however, and  is
              the only way to overwrite directory EAs under OS/2.)

			  
			  
			  
option => -f     freshen  existing  files,  i.e.,  extract only those files that already exist on disk and that are newer than the disk copies.  By default
              unzip queries before overwriting, but the -o option may be used to suppress the queries.  Note that under many operating systems,  the  TZ
              (timezone)  environment  variable  must  be  set correctly in order for -f and -u to work properly (under Unix the variable is usually set
              automatically).  The reasons for this are somewhat subtle but have to do with the differences between DOS-format file times (always  local
              time)  and Unix-format times (always in GMT/UTC) and the necessity to compare the two.  A typical TZ value is ``PST8PDT'' (US Pacific time
              with automatic adjustment for Daylight Savings Time or ``summer time'').
			  