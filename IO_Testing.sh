Write
=======

 dd if=/dev/zero of=testfile bs=1G count=1 oflag=direct

https://medium.com/@kenichishibata/test-i-o-performance-of-linux-using-dd-a5074f1de9ce  => dd if=/dev/zero of=testfile bs=1G count=1 conv=fdatasync

https://www.cyberciti.biz/faq/howto-linux-unix-test-disk-performance-with-dd-command/ => dd if=/dev/zero of=testfile bs=1G count=1 conv=fdatasync

Read
=====

https://www.cyberciti.biz/faq/howto-linux-unix-test-disk-performance-with-dd-command/

flush
echo 3 | sudo tee /proc/sys/vm/drop_caches
time dd if=/path/to/bigfile of=/dev/null bs=8k


Write (Throughput + Latency) & Read
====================================

https://www.cyberciti.biz/faq/howto-linux-unix-test-disk-performance-with-dd-command/


Write (Throughput + Latency)
================================

https://www.thomas-krenn.com/en/wiki/Linux_I/O_Performance_Tests_using_dd
