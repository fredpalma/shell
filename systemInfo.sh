#!/bin/bash
###################################################
# NOME: systemInfo.sh                             # 
# Author: Frederico Palma (fredpalma@gmail.com)   #
# Date: 03/02/2019                                #
# Description: Info report from Linux machine     #
# To run: ./systemInfo.sh                         #
###################################################
DATE=$(date +%F)
HOSTNAME=$(hostname)
LOCALIP=$(hostname -i)
PUBLICIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
KERNEL=$(uname -mrs)
USER=$(whoami)
CPUNU=$(cat /proc/cpuinfo | grep "model name" | wc -l)
CPUMODEL=$(cat /proc/cpuinfo | grep "model name" | head -n1 | cut -c14-)
MEMTOTAL=$(expr $(cat /proc/meminfo | grep MemTotal | tr -d ' ' | cut -d: -f 2 | tr -d kB)) 
MEMFREE=$(expr $(cat /proc/meminfo | grep MemFree | tr -d ' ' | cut -d: -f 2 | tr -d kB))
MEMAVA=$(expr $(cat /proc/meminfo | grep MemAvailable | tr -d ' ' | cut -d: -f 2 | tr -d kB)) 
FILESYS=$(df -h | egrep -v '(tmpfs|udev)')
UPTIME=$(uptime -s)
clear
echo "-------------------------------------------------------------"
echo "Hostname: $HOSTNAME"
echo "Date: $DATE"
echo "User: $USER:"
echo "-------------------------------------------------------------"
echo "Kernel: $KERNEL"
echo "IP Local: $LOCALIP Public: $PUBLICIP"
echo "Uptime: $UPTIME"
echo "CPU Model: $CPUMODEL"
echo "# CPUs/Core: $CPUNU"
echo "Memory (MB) Total: $MEMTOTAL Free: $MEMFREE Available:$MEMAVA"
echo "Partitions:"
echo "$FILESYS"
echo "-------------------------------------------------------------"
exit
