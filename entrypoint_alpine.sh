#!/bin/sh

# Start the run once job.
echo "Docker container has been started"

echo "SHELL=/bin/sh
10 3 * * * find /youtube-dl -type f -name 'sync.sh' -exec sh {} \; >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > scheduler.txt

crontab scheduler.txt

/usr/sbin/crond -f -l 8

