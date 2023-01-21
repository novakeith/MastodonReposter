FROM python:3.10-slim-bullseye
WORKDIR /usr/src/app
COPY ./reblogger.py ./
RUN chmod +x reblogger.py

# install Mastodon.py library
RUN pip install Mastodon.py

# install if needed
RUN apt update
RUN apt-get -y install cron

# add cron to run the script every X minutes - change to your liking
# by default, it will run every 30 min
RUN crontab -l | { cat; echo "*/30 * * * * /usr/local/bin/python3 /usr/src/app/reblogger.py"; } | crontab -

# run the cmd at startup because why not
CMD [ "cron", "-f" ]
