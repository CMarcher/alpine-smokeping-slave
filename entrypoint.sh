#!/bin/sh

echo "Loading secret..."
echo $SLAVE_SECRET > /var/smokeping/secret.txt

chmod 600 /var/smokeping/secret.txt
chown smokeping:root /var/smokeping/secret.txt
chown smokeping:root /usr/cache/smokeping

echo "Starting smokeping..."
smokeping --master-url=$MASTER_URL --cache-dir=/usr/cache/smokeping --shared-secret=/var/smokeping/secret.txt --slave-name=archer

sleep infinity