#!/bin/bash
# System monitoring script

LOG_FILE="/var/log/system_monitor.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Check disk usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check memory usage  
MEM_USAGE=$(free | awk 'NR==2{printf "%.2f%%", $3*100/$2}')

# Check CPU load
CPU_LOAD=$(uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | sed 's/,//')

# Check running processes
PROCESS_COUNT=$(ps aux | wc -l)

# Log results
echo "[$DATE] DISK_USAGE=${DISK_USAGE}% MEM_USAGE=${MEM_USAGE} CPU_LOAD=${CPU_LOAD} PROCESSES=${PROCESS_COUNT}" >> $LOG_FILE

# Alert if disk usage > 80%
if [ $DISK_USAGE -gt 80 ]; then
    echo "[$DATE] ALERT: High disk usage detected: ${DISK_USAGE}%" >> $LOG_FILE
fi
