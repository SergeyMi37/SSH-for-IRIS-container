#!/bin/bash
service ssh start
sleep 5  
service ssh status
/sshacc.sh
echo 'echo "done"' > /sshacc.sh
