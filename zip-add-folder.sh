https://www.geeksforgeeks.org/zip-command-in-linux-with-examples/


[iceadminPD@sesklentsspd03 fileintegrity]$ pwd
/entimice/fileintegrity

[iceadminPD@sesklentsspd03 fileintegrity]$ ls -lrt
total 2612
-rw-r--r--.  1 iceadminPD icegroupPD 2657418 Jan  8 14:58 fileintegrity.zip.old
drwxr-xr-x. 11 iceadminPD icegroupPD    4096 Jan  9 15:36 fileintegrity

[iceadminPD@sesklentsspd03 fileintegrity]$ zip -r fileintegrity.zip fileintegrity/
  adding: fileintegrity/ (stored 0%)
  adding: fileintegrity/FilesIntegrityChecker_PRD_20July2020/ (stored 0%)
  adding: fileintegrity/FilesIntegrityChecker_PRD_20July2020/ConfigFile.xml (deflated 54%)
  adding: fileintegrity/FilesIntegrityChecker_PRD_20July2020/FilesIntegrityChecker.py (deflated 72%)
  adding: fileintegrity/FilesIntegrityChecker_PRD_20July2020/logging_config.ini (deflated 48%)
  adding: fileintegrity/FilesIntegrityChecker_PRD_20July2020/logs/ (stored 0%)
  adding: fileintegrity/FilesIntegrityChecker_PRD_20July2020/logs/FilesIntegrityCheckerLog.log (deflated 92%)
  adding: fileintegrity/FilesIntegrityChecker_PRD_20July2020/logs/20200720_173639/ (stored 0%)
......
......
......

  adding: fileintegrity/FilesIntegrityChecker_PRD_9Jan2021_cdar/ConfigFile.xml_orig (deflated 55%)
  adding: fileintegrity/FilesIntegrityChecker_PRD_9Jan2021_cdar/ProjectsFile.txt_notworking (deflated 11%)
  adding: fileintegrity/FilesIntegrityChecker_PRD_9Jan2021_cdar/nohup.out
zip warning: Permission denied
        zip warning: could not open for reading: fileintegrity/FilesIntegrityChecker_PRD_9Jan2021_cdar/nohup.out

zip warning: Not all files were readable
  files/entries read:  20286 (1.7G bytes)  skipped:  4 (2.7K bytes)
[iceadminPD@sesklentsspd03 fileintegrity]$ cat fileintegrity/FilesIntegrityChecker_PRD_9Jan2021_cdar/nohup.out
cat: fileintegrity/FilesIntegrityChecker_PRD_9Jan2021_cdar/nohup.out: Permission denied

[iceadminPD@sesklentsspd03 fileintegrity]$ ls -lrth
total 239M
-rw-r--r--.  1 iceadminPD icegroupPD 2.6M Jan  8 14:58 fileintegrity.zip.old
drwxr-xr-x. 11 iceadminPD icegroupPD 4.0K Jan  9 15:36 fileintegrity
-rw-r--r--.  1 iceadminPD icegroupPD 236M Jan 16 08:16 fileintegrity.zip
