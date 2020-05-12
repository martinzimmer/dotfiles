#!/bin/bash
folder="/path/to/backup/folder"
#get the newest file
latest=$(ls -Art "$folder" | tail -n 1)
#get the last modified time (birth is sometimes empty)
modified=$(stat "$folder"/$latest" | grep Modify | awk '{print $1}')
#is it from today?
if [[ "$modified" != "$today" ]]; then
    #send mail alert
    echo "Subject: Backup Failed\n\nNo backup was found" | ssmtp myemail@gmail.com
fi

#mail setup:
#apt-get install ssmtp
#/etc/ssmtp/ssmtp.conf
root=myemail@gmail.com
mailhub=smtp.gmail.com:465
FromLineOverride=YES
AuthUser=myemail@gmail.com
AuthPass=passwordhere
UseTLS=YES

Setup a new gmail account for this. saving your password in text is bad for your real email.
