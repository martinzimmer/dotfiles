#!/bin/sh

(tail --lines=999 /var/log/rsnapshot) | /usr/bin/grep $(date '+%Y-%m-%d') | /usr/bin/grep daily | /usr/bin/grep -q "completed successfully"

if [ $? -eq 0 ] ;then

echo "Everything seems OK with the backup! Awesome. ($?)"

else

echo "Something was NOT right with the backup. ($?) Sending email ..."

echo "Email body" | (/usr/bin/mail -v -s "EMAIL SUBJECT" -r from@domain.tld recipient@domain.tld)

fi
