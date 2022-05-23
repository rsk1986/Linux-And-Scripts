cp -R /home/knkl702 /tmp/hm






cp -R /csre/dev/benra/dsur2017/sp/data/raw /csre/prod/benra/dsur2017/data/final



cp -p => 

-p     same as --preserve=mode,ownership,timestamps

 --preserve[=ATTR_LIST]
          preserve the specified attributes (default: mode,ownership,timestamps),
          if possible additional attributes: context, links, xattr, all
		  

backup1
========
cp -Rp /opt/tarantella /tmp/tarantella.backup 2> /tmp/tarantella.backup.error


backup
========
find /opt/tarantella | cpio -ov > /tmp/tarantella.backup/backup.cpio

restore
========

cpio -idv < /tmp/tarantella.backup/backup.cpio

http://www.thegeekstuff.com/2010/08/cpio-utility/



		  




