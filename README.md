# CLI Learning Website Project

Proyek ini dirancang khusus untuk pembelajaran Command Line Interface (CLI) dengan fokus pada file management dan log analysis.

## Struktur Direktori

```
web-project/
├── src/                 # Source code website
├── logs/               # Various log files untuk practice
├── config/            # Configuration files
├── scripts/           # Automation scripts
├── data/              # Data files (CSV, JSON)
├── temp/              # Temporary files
└── backup/            # Backup directories
```

## CLI Learning Examples

### 1. File Permissions Practice
```bash
# Check file permissions
ls -la config/database/db_credentials.conf
ls -la scripts/deployment/

# Find files with specific permissions
find . -perm 600                    # Owner-only files
find . -perm 755 -type f            # Executable files
find . -perm 644                    # Standard readable files

# Change permissions
chmod 755 scripts/custom_script.sh  # Make executable
chmod 600 config/secret_key.txt     # Owner only
chmod 644 data/public_data.csv      # Everyone can read

# Check directory permissions
ls -ld temp/user_files/*/           # Directory permissions
find . -type d -perm 750            # Group accessible dirs

# Permission octal notation
stat -c "%a %n" config/ssh/id_rsa   # Show octal permissions
```

### 2. User and Group Management
```bash
# Check file ownership
ls -la logs/security/audit.log

# Find files by owner/group
find . -user root -type f
find . -group www-data -type f

# Change ownership (if you have permissions)
chown user:group filename
chgrp groupname filename
```

### 3. Grep Examples
```bash
# Cari error dalam log
grep "ERROR" logs/error/application.log

# Cari IP address tertentu
grep "192.168.1.100" logs/access/apache-access.log

# Cari dengan case insensitive
grep -i "failed" logs/security/auth.log

# Count occurrences
grep -c "GET" logs/access/nginx-access.log

# Show line numbers
grep -n "database" logs/error/application.log
```

### 3. Grep Examples
```bash
# Extract IP addresses from access log
awk '{print $1}' logs/access/apache-access.log

# Calculate total bytes served
awk '{sum+=$10} END {print "Total bytes:", sum}' logs/access/apache-access.log

# Process CSV files
awk -F',' 'NR>1 {print $2, $4}' data/users/user_list.csv
```

### 4. Awk Examples
```bash
# Replace text in files
sed 's/ERROR/CRITICAL/' logs/error/application.log

# Delete empty lines
sed '/^$/d' logs/error/system.log

# Print specific lines
sed -n '5,10p' data/products/inventory.csv
```

### 5. Sed Examples
```bash
# Complex pipeline
grep "ERROR" logs/error/application.log | awk '{print $1, $2}' | sort | uniq -c

# Redirect output
ls -la > temp/directory_listing.txt

# Append to file
echo "New log entry" >> logs/custom.log

# Pipe to multiple commands
cat data/users/user_list.csv | grep "active" | wc -l
```

### 6. Pipes and Redirection
```bash
# Find all log files
find . -name "*.log" -type f

# Find files modified in last 7 days
find . -mtime -7 -type f

# Find and process files
find logs/ -name "*.log" -exec grep -l "ERROR" {} \;
```

### 7. Find Examples
```bash
# Monitor running processes
ps aux | grep nginx

# Kill processes by name
pkill -f "php-fpm"

# Background processes
./scripts/monitoring/check_system.sh &

# Job control
jobs
fg %1
```

### 8. Process Management

1. **Access Log Analysis**
   - Hitung berapa request per IP
   - Temukan 404 errors
   - Analisis user agents

2. **Error Log Analysis**  
   - Kategorikan error berdasarkan severity
   - Hitung frequency of errors
   - Timeline analysis

3. **Security Log Analysis**
   - Detect brute force attempts
   - Monitor sudo usage
   - Track login patterns

## Permission Management Challenges

1. **File Permission Analysis**
   - Audit file permissions across project
   - Find insecure file permissions (world-writable)
   - Identify files that should be executable

2. **Security Audit**
   - Check for files with sensitive data
   - Verify proper permissions on config files
   - Monitor permission changes

3. **Access Control**
   - Practice chmod, chown, chgrp commands
   - Understand octal vs symbolic notation
   - Group permission management

## Log Analysis Challenges

1. Gunakan `less` atau `more` untuk membaca log files yang besar
2. Combine multiple tools: `grep | awk | sort | uniq -c`
3. Use `tail -f` untuk monitor log files real-time
4. Practice dengan `crontab` untuk automation
5. Learn `rsync` untuk file synchronization

## Scripts yang Bisa Dijalankan

- `scripts/monitoring/check_system.sh` - Monitor system resources
- `scripts/deployment/deploy.sh` - Deploy website files

Selamat belajar CLI! 🚀
