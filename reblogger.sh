#! usr/bin/bash
#The shell script that gets executed by the container. You should not need to modify this.

# add cron to run the script every X minutes - change to your liking using ENV variable CRONAMT
# by default, it will run every 30 min. URL / Token / Account are modifiable in the Dockerfile
# or via cmd line args.

crontab -l | { cat; echo "*/$CRONAMT * * * * /usr/local/bin/python3 /usr/src/app/reblogger.py $MASTURL $MASTKN $MASACT"; } | crontab -

# run cron to keep container alive
cron -f
