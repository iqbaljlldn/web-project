#!/bin/bash
# System status monitoring - READ ONLY

echo "=== SYSTEM STATUS ==="
echo "Date: $(date)"
echo "Uptime: $(uptime)"
echo "Disk Usage:"
df -h
echo ""
echo "Memory Usage:"
free -h
echo ""
echo "Top 5 CPU processes:"
ps aux --sort=-%cpu | head -6
