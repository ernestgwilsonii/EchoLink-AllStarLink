#!/bin/bash

#######################################################################################################################
# Adds RadioFan.Club "Group Favorites" to HamVoIP AllStarLink node on Raapberry Pi                                    #
#                     Group Favorites hack add-on by: Ryan - https://github.com/MrMophandle                           #
#                                                                                                                     #
#  Usage:                                                                                                             #
#   ssh -p 222 root@YourPiIPAddressHere                                                                               #
#   cd /tmp                                                                                                           #
#   curl https://raw.githubusercontent.com/ernestgwilsonii/EchoLink-AllStarLink/main/add_group_favorites.sh | bash -  #
#                                                                                                                     #
#                                                                                ErnestGWilsonII@gmail.com 2021-10-24 #
#                                                                                  https://github.com/ernestgwilsonii #
#                                                                         https://www.linkedin.com/in/ernestgwilsonii #
#######################################################################################################################

# Add the update copy script
cd /usr/local/sbin
cp /usr/local/sbin/supermon-syncgrpfavs.sh /usr/local/sbin/supermon-syncgrpfavs.sh.$(date '+%Y-%m-%d_%H:%M:%S') && rm -rf /usr/local/sbin/supermon-syncgrpfavs.sh
cd /usr/local/sbin
wget https://raw.githubusercontent.com/ernestgwilsonii/EchoLink-AllStarLink/main/usr/local/sbin/supermon-syncgrpfavs.sh
chmod a+rx /usr/local/sbin/supermon-syncgrpfavs.sh

# Backup original files & remove old
cd /srv/http/supermon
cp /srv/http/supermon/grpfavorites.php /srv/http/supermon/grpfavorites.php.$(date '+%Y-%m-%d_%H:%M:%S') && rm -rf /srv/http/supermon/grpfavorites.php
cp /srv/http/supermon/header.inc /srv/http/supermon/header.inc.$(date '+%Y-%m-%d_%H:%M:%S') && rm -rf /srv/http/supermon/header.inc
cp /srv/http/supermon/link.php /srv/http/supermon/link.php.$(date '+%Y-%m-%d_%H:%M:%S') && rm -rf /srv/http/supermon/link.php
cp /srv/http/supermon/syncgrpfavorites.php /srv/http/supermon/syncgrpfavorites.php.$(date '+%Y-%m-%d_%H:%M:%S') && rm -rf /srv/http/supermon/syncgrpfavorites.php

# Download Ryan's modified files
cd /srv/http/supermon
wget https://raw.githubusercontent.com/ernestgwilsonii/EchoLink-AllStarLink/main/srv/http/supermon/grpfavorites.php
wget https://raw.githubusercontent.com/ernestgwilsonii/EchoLink-AllStarLink/main/srv/http/supermon/header.inc
wget https://raw.githubusercontent.com/ernestgwilsonii/EchoLink-AllStarLink/main/srv/http/supermon/link.php
wget https://raw.githubusercontent.com/ernestgwilsonii/EchoLink-AllStarLink/main/srv/http/supermon/syncgrpfavorites.php

# Set permissions
cd /srv/http/supermon
chown root:http /srv/http/supermon/grpfavorites.php
chown root:http /srv/http/supermon/header.inc
chown root:http /srv/http/supermon/link.php
chown root:http /srv/http/supermon/syncgrpfavorites.php
chmod a+r /srv/http/supermon/grpfavorites.php
chmod a+r /srv/http/supermon/header.inc
chmod a+r /srv/http/supermon/link.php
chmod a+r /srv/http/supermon/syncgrpfavorites.php
