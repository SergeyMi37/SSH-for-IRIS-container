#!/bin/bash
chmod 4755 /usr/sbin/sshd 
/sshacc.sh
echo 'echo "done"' > /sshacc.sh
mkdir /run/sshd 
echo "ok"
