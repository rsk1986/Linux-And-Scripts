nohup rsync --times --verbose --recursive --checksum --human-readable /entimice/preprod_data_new/root /entimice/pre_prod_data 2>&1 > /entimice/MIGRATION_FOLDER/rsync_filesysroot.log &



nohup rsync --times --verbose --recursive --checksum --human-readable /entimice/pre_prod_data/root /entimice/filesystem/filesysroot 2>&1 > /entimice/MIGRATION_FOLDER/rsync_filesysroot.log &


