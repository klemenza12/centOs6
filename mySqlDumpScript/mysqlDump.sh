#!/bin/bash
# Database credentials
 user=""
 password=""
 host=""
 db_name="testDB"

# Other options
 backup_path="/home/klemenza/Desktop/scripts/mysqlBackup"
 date=$(date +"%d-%b-%Y")

# Set default file permissions
 umask 774

# Dump database into SQL file
 mysqldump --user=$user --password=$password --host=$host $db_name > $backup_path/$db_name-$date.sql

# Delete files older than 30 days
 find $backup_path/* -mtime +30 -exec rm {} \;

# to restore a db mysql testDB < backedUp.sql
