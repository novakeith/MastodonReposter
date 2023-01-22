# Reblogger v2
# Set up to run with a cron every 30min etc.
# this is super preliminary and my first foray into the Mastodon.py library
# plenty of ways to make this code suck less but this achieves what I need

# import Mastodon.py - I installed via PyPI
from mastodon import Mastodon
#import sys tools
import sys

# Fail if cmdline args are not present - does not check if they are valid.
if len(sys.argv) < 4:
    quit("Reblogger.py: Error - Command line arguments missing. There should be, in this order: [Instance URL] [Access Token] [Account to Repost]")

mURL = sys.argv[1] #Your Mastodon URL
mTkn = sys.argv[2] #Your Access Token (set in "Development" settings)
mAcc = sys.argv[3] #The account you want to repost/boost

mastodon = Mastodon(
    access_token = mTkn,
    api_base_url = mURL
)

account = mastodon.account_lookup(mAcc) #look up the account you want to re-post

statlist = mastodon.account_statuses(account['id'])

#Right now this only checks if the post is a reply to someone else, and checks if it was reblogged
#no Time check yet. is it needed?
if (statlist[0]['in_reply_to_id'] == None and statlist[0]['reblogged'] == False):
    mastodon.status_reblog(statlist[0]['id'])

quit("Completed check")
