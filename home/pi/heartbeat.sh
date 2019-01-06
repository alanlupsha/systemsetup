#! /bin/bash
# hit a URL on mydomain.com and pass the current name of this device and the total uptime in days hours minutes seconds

uptime=$(</proc/uptime)
uptime=${uptime%%.*}

seconds=$(( uptime%60 ))
minutes=$(( uptime/60%60 ))
hours=$(( uptime/60/60%24 ))
days=$(( uptime/60/60/24 ))


MYNAME="pi-solar"
UP="${days}_d_${hours}_h_${minutes}_m_${seconds}_s"
URL="http://mydomain.com/heartbeat/${MYNAME}/uptime=${UP}"

echo "Hitting: ${URL}"

#curl -I ${URL} -O /dev/null > /dev/null 2>&1
wget ${URL} -O /dev/null > /dev/null 2>&1
