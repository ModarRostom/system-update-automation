#!/bin/bash

# Log file for updates
LOGFILE="/var/log/system_update.log"

echo "==== System Update Check: $(date) ====" >> $LOGFILE

# Check which package manager is available
if command -v dnf >/dev/null 2>&1; then
    echo "Checking for updates with DNF..." >> $LOGFILE
    dnf check-update -y >> $LOGFILE 2>&1
    if [ $? -eq 100 ]; then
        echo "Updates found. Updating now..." >> $LOGFILE
        dnf upgrade -y >> $LOGFILE 2>&1
    else
        echo "System is up to date." >> $LOGFILE
    fi
elif command -v yum >/dev/null 2>&1; then
    echo "Checking for updates with YUM..." >> $LOGFILE
    yum check-update -y >> $LOGFILE 2>&1
    if [ $? -eq 100 ]; then
        echo "Updates found. Updating now..." >> $LOGFILE
        yum update -y >> $LOGFILE 2>&1
    else
        echo "System is up to date." >> $LOGFILE
    fi
elif command -v apt >/dev/null 2>&1; then
    echo "Checking for updates with APT..." >> $LOGFILE
    apt update >> $LOGFILE 2>&1
    apt list --upgradable >> $LOGFILE
    if [ "$(apt list --upgradable 2>/dev/null | wc -l)" -gt 1 ]; then
        echo "Updates found. Updating now..." >> $LOGFILE
        apt upgrade -y >> $LOGFILE 2>&1
    else
        echo "System is up to date." >> $LOGFILE
    fi
else
    echo "No known package management system found!" >> $LOGFILE
fi

echo "==== Update check completed ====" >> $LOGFILE
