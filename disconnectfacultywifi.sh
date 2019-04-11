#!/bin/bash
#
# disconnectfacultywifi.sh
#
# Created by Michael Breeden
#

NETWORKNAME="Faculty_Access"
USER=$2

if [ "$(/usr/sbin/networksetup -getairportnetwork en0)"="Current Wi-Fi Network: $NETWORKNAME" ]; then
  /usr/sbin/networksetup -removepreferredwirelessnetwork en0 $NETWORKNAME
  /usr/sbin/networksetup -setairportpower en0 off
  /usr/sbin/networksetup -setairportpower en0 on
  /usr/bin/security delete-generic-password -a $NETWORKNAME /Library/Keychains/System.keychain
  keychain=$(ls /Users/$user/Library/Keychains | grep -v "login.keychain-db" | grep -v ".f" | grep -v "metadata.keychain-db")
  /bin/rm -rf /Users/$USER/Library/Keychains/$keychain
else
  echo "Not Connected to $NETWORKNAME"
fi

exit 0
