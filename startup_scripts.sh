#!/bin/bash
python /home/smb/smbserver.py #&  
# tcpdump -p -f "port 445 or port 139" -w /var/log/smblog.pcap
