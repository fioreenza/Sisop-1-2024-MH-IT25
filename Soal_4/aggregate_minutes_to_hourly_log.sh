#!/bin/bash

#* * * * * /bin/bash /home/ludwigd/SisOP/Nomor4/minute_log.sh

#0 * * * * /bin/bash /home/ludwigd/SisOP/Nomor4/aggregate_minutes_to_hourly_log.sh

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/ludwigd/SisOP/Nomor4

log_dir="/home/ludwigd/SisOP/Nomor4/log"
files=$(ls -1 ${log_dir}/metrics_*.log | awk -F '[_.]' '{print $2$3}' | sort -n | tail -n 1)

latest_hour=${files:8:2}

file_agg="metrics_agg_${files:0:8}${latest_hour}.log"
timestamp=$(date +"%Y%m%d%H")

mem_total_min=1000000
mem_total_max=0
mem_total_sum=0
mem_used_min=1000000
mem_used_max=0
mem_used_sum=0
mem_free_max=0
mem_free_min=1000000
mem_free_sum=0
mem_shared_min=1000000
mem_shared_max=0
mem_shared_sum=0
mem_buff_min=1000000
mem_buff_max=0
mem_buff_sum=0
mem_available_min=1000000
mem_available_max=0
mem_available_sum=0
swap_total_min=1000000
swap_total_max=0
swap_total_sum=0
wswap_used_min=1000000
swap_used_max=0
swap_used_sum=0
swap_free_min=1000000
swap_free_max=0
swap_free_sum=0
path_size_min=1000000
path_size_max=0
path_size_sum=0
count=0

for file in /home/ludwigd/SisOP/Nomor4/log/metrics_${files:0:8}${latest_hour}*.log; do
        while IFS=',' read -r mem_total mem_used mem_free mem_shared mem_buff mem_available swap_total swap_used swap_free path path_size; do
                if [[ "$mem_total" =~ ^[0-9]+$ ]]; then
                        ((count++))
                        mem_total_sum=$((mem_total_sum + mem_total))
                        mem_used_sum=$((mem_used_sum + mem_used))
                        mem_free_sum=$((mem_free_sum + mem_free))
                        mem_shared_sum=$((mem_shared_sum + mem_shared))
                        mem_buff_sum=$((mem_buff_sum + mem_buff))
                        mem_available_sum=$((mem_available_sum + mem_available))
                        swap_total_sum=$((swap_total_sum + swap_total))
                        swap_used_sum=$((swap_used_sum + swap_used))
                        swap_free_sum=$((swap_free_sum + swap_free))

                        mem_total_min=$((mem_total < mem_total_min ? mem_total : mem_total_min))
                        mem_total_max=$((mem_total > mem_total_max ? mem_total : mem_total_max))
                        mem_used_min=$((mem_used < mem_used_min ? mem_used : mem_used_min))
                        mem_used_max=$((mem_used > mem_used_max ? mem_used : mem_used_max))
                        mem_free_max=$((mem_free > mem_free_max ? mem_free : mem_free_max))
                        mem_free_min=$((mem_free < mem_free_min ? mem_free : mem_free_min))
                        mem_shared_min=$((mem_shared < mem_shared_min ? mem_shared : mem_shared_min))
                        mem_shared_max=$((mem_shared > mem_shared_max ? mem_shared : mem_shared_max))
                        mem_buff_min=$((mem_buff < mem_buff_min ? mem_buff : mem_buff_min))
                        mem_buff_max=$((mem_buff > mem_buff_max ? mem_buff : mem_buff_max))
                        mem_available_min=$((mem_available < mem_available_min ? mem_available : mem_available_min))
                        mem_available_max=$((mem_available > mem_available_max ? mem_available : mem_available_max))
                        swap_total_min=$((swap_total < swap_total_min ? swap_total : swap_total_min))
                        swap_total_max=$((swap_total > swap_total_max ? swap_total : swap_total_max))
                        swap_used_min=$((swap_used < swap_used_min ? swap_used : swap_used_min))
                        swap_used_max=$((swap_used > swap_used_max ? swap_used : swap_used_max))
                        swap_free_min=$((swap_free < swap_free_min ? swap_free : swap_free_min))
                        swap_free_max=$((swap_free > swap_free_max ? swap_free : swap_free_max))

                        num_path_size=$(numfmt --from=iec $path_size 2>/dev/null || /usr/bin/echo "0")
                        path_size_sum=$((path_size_sum + num_path_size))
                        path_size_min=$((num_path_size < path_size_min ? num_path_size : path_size_min))
                        path_size_max=$((num_path_size > path_size_max ? num_path_size : path_size_max))
                fi
        done < $file
done

if [ $count -ne 0 ]
then
        average_mem_total=$((mem_total_sum / count))
        average_mem_used=$((mem_used_sum / count))
        average_mem_free=$((mem_free_sum / count))
        average_mem_shared=$((mem_shared_sum / count))
        average_mem_buff=$((mem_buff_sum / count))
        average_mem_available=$((mem_available_sum / count))
        average_swap_total=$((swap_total_sum / count))
        average_swap_used=$((swap_used_sum / count))
        average_swap_free=$((swap_free_sum / count))
        average_path_size=$((path_size_sum / count))
else
        average_mem_total=0
        average_mem_used=0
        average_mem_free=0
        average_mem_shared=0
        average_mem_buff=0
        average_mem_available=0
        average_swap_total=0
        average_swap_used=0
        average_swap_free=0
        average_path_size=0
fi

path_log="/home/ludwigd/SisOP/Nomor4/log"

echo "minimum,$mem_total_min,$mem_used_min,$mem_free_min,$mem_shared_min,$mem_buff_min,$mem_available_min,$swap_total_min,$swap_used_min,$swap_free_min,/home/ludwigd/,$(numfmt --to=iec $path_size_min)" >> /home/ludwigd/SisOP/Nomor4/log/metrics_agg_$timestamp.log
echo "maximum,$mem_total_max,$mem_used_max,$mem_free_max,$mem_shared_max,$mem_buff_max,$mem_available_max,$swap_total_max,$swap_used_max,$swap_free_max,/home/ludwigd/,$(numfmt --to=iec $path_size_max)" >> /home/ludwigd/SisOP/Nomor4/log/metrics_agg_$timestamp.log
echo "average,$average_mem_total,$average_mem_used,$average_mem_free,$average_mem_shared,$average_mem_buff,$average_mem_available,$average_swap_total,$average_swap_used,$average_swap_free,/home/ludwigd/,$(numfmt --to=iec $average_path_size)" >> /home/ludwigd/SisOP/Nomor4/log/metrics_agg_$timestamp.log

chmod 600 "/home/ludwigd/SisOP/Nomor4/log/metrics_agg_$timestamp.log"
