iostat 10 8640 -t -k -x -N

 iostat
              Display a single history since boot report for all CPU and Devices.

       iostat -d 2
              Display a continuous device report at two second intervals.

       iostat -d 2 6
              Display six reports at two second intervals for all devices.

       iostat -x sda sdb 2 6
              Display six reports of extended statistics at two second intervals for devices sda and sdb.

       iostat -p sda 2 6
	   iostat -p sda sdb 2 6
              Display six reports at two second intervals for device sda and all its partitions (sda1, etc.)


lsblk - list devices