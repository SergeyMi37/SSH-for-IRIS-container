#!/bin/bash
apt-get update 
apt-get install ssh -y   
/sshacc.sh
echo 'echo "done"' > /sshacc.sh
mkdir /run/sshd
echo "ok"

