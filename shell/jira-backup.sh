#!/bin/bash

# Variables
BACKUP_DIR="/Volumes/Backups/"
JIRA_HOME="/Volumes/jira/"
DB_NAME="jira"
DB_USER="jira"
DB_PASS="jira"
JIRA_CONTAINER="jira-container"
PSQL_CONTAINER="psql-container"
# Date format for backup files
DATE=$(date +%Y%m%d%H%M)

# Stop Jira
docker stop $JIRA_CONTAINER

# Backup the database
docker exec -t $PSQL_CONTAINER  pg_dump -U $DB_USER -d $DB_NAME -F c -f /tmp/db_backup.dump && docker cp $PSQL_CONTAINER:/tmp/db_backup.dump $BACKUP_DIR/db_backup.dump

# Backup the Jira home directory
tar -czvf $BACKUP_DIR/jira_home_backup_$DATE.tar.gz $JIRA_HOME

# Start Jira
docker start $JIRA_CONTAINER $PSQL_CONTAINER

# Optional: remove old backups (older than 7 days)
find $BACKUP_DIR -type f -name "*.sql" -mtime +7 -exec rm {} \;
find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;
