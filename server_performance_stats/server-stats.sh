#!/bin/bash

#Total CPU Usage
cpu_usage=$(mpstat | awk '$12 ~ /[0-9.]+/ { print 100 - $12 }')
echo "CPU Usage: $cpu_usage%"
#Total Memory Usage (free vs used %)
free_mem=$(free | grep Mem | awk '{print $7/$2 * 100}') 
used_mem=$(free | grep Mem | awk '{print ($2-$7)/$2 * 100}') 
echo "Used Memory: $free_mem%"
echo "Free Memory : $used_mem%"

#Total Disk Usage (free vs used %)
free_disk=$(df / | grep / | awk '{print $4/$2 * 100}')
used_disk=$(df / | grep / | awk '{print $3/$2 * 100}')
echo "Free Disk: $free_disk%"
echo "Used Disk: $used_disk%"

#Top 5 Processes by CPU Usage
cpu_proc=$(ps -eo %cpu,pid,command --sort=-%cpu | head -n 6)
echo -e "\nTop 5 Processes by CPU:\n $cpu_proc"
#Top 5 Processes by Memory Usage
mem_proc=$(ps -eo %mem,pid,command --sort=-%mem | head -n 6)
echo -e "\nTop 5 Processes by Memory:\n $mem_proc"