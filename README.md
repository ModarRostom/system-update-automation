# Automated System Updates (Bash & Ansible)

## Description
This project contains a **Bash script** and an **Ansible Playbook** to check for and install system updates automatically.  
It ensures that Linux servers remain up to date by automating the update process.

## Features
- Supports **RHEL, Debian, and Ubuntu**  
- **Bash script** for standalone automation  
- **Ansible Playbook** for managing multiple servers  
- Includes **logging** for troubleshooting  
- **Cron-job compatibility** for scheduling regular updates  

## Usage
### Running the Bash Script Manually
```bash
chmod +x update_system.sh
./update_system.sh
