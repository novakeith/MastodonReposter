# MastodonReposter
Reposts (boosts) statuses from a single account

# Instructions:
1. Edit details as needed in reblogger.py
2. Edit details in Dockerfile - specifically the cronjob to determine how often you want this to run
3. Build docker image: `docker build -t mastodonreposter .`
4. Run docker image: `docker run -d mastodonreposter  `

## To Do
- instead of having to edit stuff I'll just make things accessible via command line args
