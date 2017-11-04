#!/bin/bash

echo "***********************System Configuration Tests***********************"
echo "************************************************************************"
systemctl status nginx
if [ $? -eq 0 ]
then
echo "********************************************************"
echo "********************************************************"
echo "Nginx is Running"
echo "********************************************************"
echo "********************************************************"
else
echo "********************************************************"
echo "********************************************************"
echo "Nginx is stopped"
echo "********************************************************"
echo "********************************************************"
fi
a="active"
n=`systemctl is-active nginx`
if [ $sn = $sa ]
then
echo "Nginx service is started at Boot time"
echo "********************************************************"
echo "********************************************************"
else
echo "Nginx service is not started at Boot time"
echo "********************************************************"
echo "********************************************************"
fi
n=`netstat -ntlp | grep LISTEN | grep -v tcp6 | awk {'print $4'} | cut -d ":" -f2 | grep -v 80 | grep -v 22 | grep -v 443 | wc -l`
if [ $n -eq 0 ]
then
echo "Only Port 80, 443 and 22 are open and listening"
echo "********************************************************"
echo "********************************************************"
else
echo "Ports other than 80, 443 and 22 are open and listening"
echo "The list of other listening ports are :-"
echo "`netstat -ntlp | grep LISTEN | grep -v tcp6 | awk {'print $4'} | cut -d ":" -f2 | grep -v 80 | grep -v 22 | grep -v 443`"
echo "********************************************************"
echo "********************************************************"
fi
echo "System memory usage"
echo "-------------------"
`free -m`
echo "********************************************************"
echo "********************************************************"
echo "System CPU Load average"
echo "-----------------------"
`uptime`
echo "********************************************************"
echo "********************************************************"
echo "System Disk usage"
echo "-----------------"
df -kh

