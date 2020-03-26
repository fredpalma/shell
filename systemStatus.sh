#!/bin/bash
###################################################
# NOME: systemStatus.sh                           # 
# Author: Frederico Palma (fredpalma@gmail.com)   #
# Date: 20/12/2018                                #
# Description: Show system status                 #
# To run: ./systemStatus.sh                       #
###################################################

DATE=$(date +%F)
UPTIME=$(uptime -s)
WHO=$(w)
LAST5LOGINS=$(last -a | head -5)
DISKUSAGE=$(df -h | xargs | awk '{print "Free/total disk: " $11 " / " $9}')
MEMORYUSAGE=$(free -m | xargs | awk '{print "Free/total memory: " $17 " / " $8 " MB"}')
TOP=$(top -b -o +%MEM | head -n 27)
HEAVYPROCESS=$(top -b | head -10 | tail -4)
TCP=$(nmap -p- -T4 127.0.0.1)
CONNECTIONS=$(ss -s)
PROCESSES=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 20)
VMSTAT=$(vmstat 1 5)
LSOFNET=$(lsof -i)

clear
echo "-------------------------------------------------------------"
echo "Date: $DATE"
echo "Uptime: $UPTIME"
echo "Disk usage: $DISKUSAGE"
echo "Memory usage: $MEMORYUSAGE"
echo "Who is logged:"
echo "$WHO"
echo "Last 5 logins:"
echo "$LAST5LOGINS"
echo "Top 20 Processes sorting by memory (desc):"
echo "$TOP"
echo "Heavy processes:" 
echo "$HEAVYPROCESS"
echo "Open TCP ports:"
echo "$TCP"
echo "Current connections:"
echo "$CONNECTIONS"
echo "Network connections:"
echo "$LSOFNET"
echo "Top Processes sorted by RAM and CPU:"
echo "$PROCESSES"
echo "Virtual Memory Statistics:"
echo "$VMSTAT"
echo "-------------------------------------------------------------"
exit
