#!/bin/bash
# Log rotation script
LOG_DIR="/var/log/webapp"
BACKUP_DIR="/var/log/webapp/archive"

# Create archive directory if not exists
mkdir -p $BACKUP_DIR

# Rotate access logs
if [ -f "$LOG_DIR/access.log" ]; then
    mv "$LOG_DIR/access.log" "$BACKUP_DIR/access.log.$(date +%Y%m%d)"
    touch "$LOG_DIR/access.log"
fi

# Compress old logs
find $BACKUP_DIR -name "*.log.*" -mtime +7 -exec gzip {} \;
