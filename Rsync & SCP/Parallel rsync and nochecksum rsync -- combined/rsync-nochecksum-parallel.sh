rsync --exclude ZZZ --times --verbose --recursive  --human-readable /entimice/transfer_test_src/root/*  /entimice/transfer_test_trgt/root
rsync --times --verbose --recursive --human-readable /entimice/transfer_test_src/root/ZZZ  /entimice/transfer_test_trgt/root
===
rsync --exclude ZZZ --times --verbose --recursive  --human-readable /entimice/transfer_test_src/root/*  /entimice/transfer_test_trgt/root
rsync --times --verbose --recursive --human-readable /entimice/transfer_test_src/root/ZZZ  /entimice/transfer_test_trgt/root
===



NOTE: 

1. ZZZ is a relative directory and it should present under /entimice/transfer_test_src/root/
2. The pair of commands can be executed everytime during incrementals



