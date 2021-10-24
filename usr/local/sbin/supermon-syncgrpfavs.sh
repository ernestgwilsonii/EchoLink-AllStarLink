#/!bin/bash
# Created 2021/10 by Ryan, W3REP
#

IP=$(curl -s http://myip.hamvoip.org/ 2>&1)

### Test for Internet Connectivity
if [ "$IP" != "" ] ; then
	wget -O /srv/http/supermon/group-favorites.ini https://raw.githubusercontent.com/ernestgwilsonii/EchoLink-AllStarLink/main/srv/http/supermon/group-favorites.ini
else
	echo "\nNo Internet connectivity - cannot synchronize favorites\n"
fi
