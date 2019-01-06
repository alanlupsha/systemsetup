#!/bin/bash
# sends a message to the cricket phone, which speaks out the message
#

USERMESSAGE="$*"

# replace the spaces in the user message with PLUS signs
USERMESSAGE=${USERMESSAGE// /+}
echo "Sending to speak: $USERMESSAGE"

/usr/bin/curl -I http://droidcricket:8080/?speak="$USERMESSAGE" &
