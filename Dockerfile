FROM python:3.10-slim-bullseye
LABEL MAINTAINER="keith@novakeith.net"
WORKDIR /usr/src/app
COPY ./reblogger.py ./
COPY ./reblogger.sh ./
RUN chmod +x reblogger.py
RUN chmod +x reblogger.sh

# define environment variables. These can be redefined via command line
ENV CRONAMT=30
ENV MASTURL="https://your-Mastodon-Instance.com"
ENV MASTKN="accessTokenHere"
ENV MASACT="account@toRepost.com"

# install Mastodon.py library
RUN pip install Mastodon.py

# install if needed
RUN apt update
RUN apt-get -y install cron

# Deprecated 
#RUN crontab -l | { cat; echo "*/$CRONAMT * * * * /usr/local/bin/python3 /usr/src/app/reblogger.py $MASTURL $MASTKN $MASACT"; } | crontab -

# run the cmd at startup, will keep container running to do continuous check
ENTRYPOINT [ "bash", "./reblogger.sh" ]
