#!/bin/bash
# Database restore script - REQUIRES ROOT
echo "Restoring database from backup..."
mysql -u root -p webapp_db < backup/database_backup.sql
echo "Database restored successfully"
