#!/bin/bash

#* * * * * /bin/bash /home/ludwigd/SisOP/Nomor4/minute_log.sh

#0 * * * * /bin/bash /home/ludwigd/SisOP/Nomor4/aggregate_minutes_to_hourly_log.sh

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/ludwigd/SisOP/Nomor4

timestamp=$(date +"%Y%m%d%H%M%S")

mem_total=$(free -m | awk '/^Mem:/{print $2}')
mem_used=$(free -m | awk '/^Mem:/{print $3}')
mem_free=$(free -m | awk '/^Mem:/{print $4}')
mem_shared=$(free -m | awk '/^Mem:/{print $5}')
mem_buff=$(free -m | awk '/^Mem:/{print $6}')
mem_available=$(free -m | awk '/^Mem:/{print $7}')

swap_total=$(free -m | awk '/^Swap:/{print $2}')
swap_used=$(free -m | awk '/^Swap:/{print $3}')
swap_free=$(free -m | awk '/^Swap:/{print $4}')

path_user="/home/ludwigd/"
path_size=$(du -sh $path_user | awk '{print $1}')

echo "$mem_total,$mem_used,$mem_free,$mem_shared,$mem_buff,$mem_available,$swap_total,$swap_used,$swap_free,$path_user,$path_size" >> /home/ludwigd/SisOP/Nomor4/log/metrics_$timestamp.log

chmod 600 "/home/ludwigd/SisOP/Nomor4/log/metrics_$timestamp.log"
