
find ./ -maxdepth 1 -mtime +272 -type d | wc -l

find ./ -maxdepth 1 -mtime +272 -type d -exec ls -ld {} \; | wc -l

ls -l /tmp/dest | wc -l


find ./ -maxdepth 1 -mtime +272 -type d -print0 | rsync -av --files-from=- --from0  ./ /tmp/dest


rsync -r -avz --remove-sent-files \
        --files-from=<(find ./ -mtime +272 -type d) ./ /tmp/dest

rsync -r -avz --remove-sent-files \
        --files-from=<(find ./ -mtime +272 -type d) ./ /tmp/dest


find ./ -print0 | rsync -av --files-from=- --from0  ./ /home/kxsb404/rsync/dest



find . -name '*.txt' | xargs ls -l 
