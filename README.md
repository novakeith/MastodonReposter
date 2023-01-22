# MastodonReposter v2
Reposts (boosts) statuses from a single account

# Instructions:
There are three ways to use this. 

1. Directly run the script via python

`python3 reblogger.py [Instance URL] [Access Token] [Account to Repost]`

2. OR, Build with Docker if you want a container version. Make sure you edit the arguments inside the Dockerfile first.

`docker build -t mastodonreposter .`

and then run with

`docker run -d mastodonreposter`

3. OR, if you have a prebuilt version of the docker image, and you need to modify the arguments before runtime:

`docker run -d -e "CRONAMT=20" -e "MASTURL=https://instance.tld" -e "MASTKN=Your-Access-Token-Here" -e "MASACT=Account-ToFollow@here.tld" mastodonreposter`

The docker image is available here: [novakeith/mastodonreposter](https://hub.docker.com/r/novakeith/mastodonreposter) - you can pull this from the command line via

`docker pull novakeith/mastodonreposter`

## To Do
- expand scope - can we have this read from a list to repost multiple accounts?
