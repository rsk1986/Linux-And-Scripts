fio --name=entice --filename=/entimice/ulock.fio --size=1G --bs=64k --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --readwrite=write --numjobs=16 --runtime 30 -time_based=1
​
fio --name=entice --filename=/entimice/ulock.fio --size=1G --bs=64k --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --readwrite=read --numjobs=16 --runtime 30 -time_based=1

fio --name=entice --filename=/entimice/ulock.fio --size=1G --bs=64k --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --readwrite=rw --numjobs=16 --runtime 30 -time_based=1
