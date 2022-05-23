Write
=======

dd if=/dev/zero of=testfileA bs=1G count=1 oflag=direct

dd if=/dev/zero of=testfileB bs=1G count=10 oflag=direct

for i in 1 2 3 4 5; do dd if=/dev/zero of=testfile$i bs=1G count=1 oflag=direct; done

Read
======

dd if=testfileA of=/dev/zero bs=1G count=1

dd if=testfileB of=/dev/zero bs=1G count=10


https://www.gbmb.org/gigabytes

15625 * 64K =>  1G

1GB -> 64K => dd if=/dev/zero of=testfile_A bs=64K count=15625 oflag=direct

10G -> 64K => dd if=/dev/zero of=testfile_B bs=64K count=156250 oflag=direct

