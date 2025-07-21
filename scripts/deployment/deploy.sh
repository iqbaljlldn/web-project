#!/bin/bash
# Deployment script

DEPLOY_LOG="/var/log/deployment.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$DATE] Starting deployment..." >> $DEPLOY_LOG

# Backup current files
echo "[$DATE] Creating backup..." >> $DEPLOY_LOG
tar -czf backup/daily/backup_$(date +%Y%m%d_%H%M%S).tar.gz src/

# Deploy new files
echo "[$DATE] Deploying files..." >> $DEPLOY_LOG
rsync -av src/ /var/www/html/

# Restart services
echo "[$DATE] Restarting web server..." >> $DEPLOY_LOG
systemctl reload nginx

echo "[$DATE] Deployment completed successfully" >> $DEPLOY_LOG
