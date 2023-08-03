#!/bin/sh

# Check if SLAVE_SECRET is set
if [ -z "$SLAVE_SECRET" ]; then
    echo "SLAVE_SECRET environment variable is not set."
    exit 1
fi

# Check if MASTER_URL is set
if [ -z "$MASTER_URL" ]; then
    echo "MASTER_URL environment variable is not set."
    exit 1
fi

# Check if SLAVE_NAME is set
if [ -z "$SLAVE_NAME" ]; then
    echo "SLAVE_NAME environment variable is not set."
    exit 1
fi

echo "Loading secret..."
echo $SLAVE_SECRET > /var/smokeping/secret.txt

# Make sure the secret and cache are available to Smokeping
chmod 600 /var/smokeping/secret.txt
chown smokeping:root /var/smokeping/secret.txt
chown smokeping:root /usr/cache/smokeping

echo "Starting Smokeping slave..."
smokeping --master-url=$MASTER_URL --cache-dir=/usr/cache/smokeping --shared-secret=/var/smokeping/secret.txt --slave-name=$SLAVE_NAME

# Check the exit status of Smokeping
if [ $? -ne 0 ]; then
  echo "Failed to start Smokeping slave. Exiting."
  exit 1
fi

# The Smokeping daemon was successful and has exited after starting Smokeping probe processes.
# Suspend this process infinitely so the container doesn't exit
sleep infinity