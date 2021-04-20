#!/bin/bash
service ssh start
sleep 5  
# service ssh status
/sshacc.sh
su irisowner
