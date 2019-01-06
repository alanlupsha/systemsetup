#!/bin/bash
#
# cleans up video files older than X days
#

SPEAK=/usr/sbin/speak.sh

DAYS=7

${SPEAK} "lauderdale server now cleaning up all video files older than ${DAYS} days"
sleep 10

CAMERA=112
COUNT=`/usr/bin/find /mnt/myraid/motion/${CAMERA}/ -type f -name '*.mkv' -mtime +${DAYS} | wc -l`
${SPEAK} "camera ${CAMERA} has ${COUNT} files"
/usr/bin/find /mnt/myraid/motion/${CAMERA}/ -type f -name '*.mkv' -mtime +${DAYS} -exec rm -f '{}' \;
sleep 10

CAMERA=113
COUNT=`/usr/bin/find /mnt/myraid/motion/${CAMERA}/ -type f -name '*.mkv' -mtime +${DAYS} | wc -l`
${SPEAK} "camera ${CAMERA} has ${COUNT} files"
/usr/bin/find /mnt/myraid/motion/${CAMERA}/ -type f -name '*.mkv' -mtime +${DAYS} -exec rm -f '{}' \;
sleep 10

CAMERA=114
COUNT=`/usr/bin/find /mnt/myraid/motion/${CAMERA}/ -type f -name '*.mkv' -mtime +${DAYS} | wc -l`
${SPEAK} "camera ${CAMERA} has ${COUNT} files"
/usr/bin/find /mnt/myraid/motion/${CAMERA}/ -type f -name '*.mkv' -mtime +${DAYS} -exec rm -f '{}' \;
sleep 10

CAMERA=115
COUNT=`/usr/bin/find /mnt/myraid/motion/${CAMERA}/ -type f -name '*.mkv' -mtime +${DAYS} | wc -l`
${SPEAK} "camera ${CAMERA} has ${COUNT} files"
/usr/bin/find /mnt/myraid/motion/${CAMERA}/ -type f -name '*.mkv' -mtime +${DAYS} -exec rm -f '{}' \;
sleep 10

${SPEAK} "lauderdale server finished cleaning up video files, hey google, beam me up"
