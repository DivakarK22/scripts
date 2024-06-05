#!/bin/bash

# Variables
BACKUP_DIR="/Volumes/Backups/"
JIRA_HOME="/Volumes/jira/"
DB_NAME="jira"
DB_USER="jira"
DB_PASS="jira"
JIRA_CONTAINER="jira-container"
PSQL_CONTAINER="psql-container"

#Removing Old Backups
echo -e "Removing old backups"
rm -rf /Volumes/Backups/*

# Date format for backup files
DATE=$(date +%Y%m%d)
echo -e "Date $DATE\n\n"
echo -e "\n\n"

# Stop Jira
echo -e "Stopping JIRA Container\n\n"
docker stop $JIRA_CONTAINER
echo -e "\n\n"

# Backup the database
echo -e "Taking psql db dumb\n\n"
docker exec -t $PSQL_CONTAINER  pg_dump -U $DB_USER -d $DB_NAME -F c -f /tmp/db_backup.dump && docker cp $PSQL_CONTAINER:/tmp/db_backup.dump $BACKUP_DIR/db_backup.dump
echo -e "\n\n"

# Backup the Jira home directory
echo -e "Backing up jira.home\n\n"
tar -czvf $BACKUP_DIR/jira_home_backup_$DATE.tar.gz $JIRA_HOME
echo -e "\n\n"

# Start Jira
echo -e "Starting JIRA Container\n\n"
docker start $JIRA_CONTAINER $PSQL_CONTAINER
echo -e "\n\n"

#Removing Old Backups
#echo -e "Removing old backups"
#rm -rf /Volumes/Backups/*
# Remove old backups (older than 7 days)
#echo -e "Removing old backups if exists more than 7 Days\n\n"
#find $BACKUP_DIR -type f -name "*.sql" -mtime +7 -exec rm {} \;
#find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;
