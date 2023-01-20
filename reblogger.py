# Reblogger
# Set up to run with a cron every hour etc.
# this is super preliminary and my first foray into the Mastodon.py library
# plenty of ways to make this code suck less but this achieves what I need

# import Mastodon.py - I installed via PyPI
from mastodon import Mastodon

mastodon = Mastodon(
    access_token = 'yourTokenHere',
    api_base_url = 'https://Your-instance.url'
)

account = mastodon.account_lookup("account@instance.tld")

statlist = mastodon.account_statuses(account['id'])

#Right now this only checks if the post is a reply to someone else, and checks if it was reblogged
#no Time check yet. is it needed?
if (statlist[0]['in_reply_to_id'] == None and statlist[0]['reblogged'] == False):
    mastodon.status_reblog(statlist[0]['id'])

quit("Completed check")
