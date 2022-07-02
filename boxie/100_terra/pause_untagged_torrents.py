import requests, sys

BASEURL = "http://10.8.0.160:8080/api/v2"

# Login
try:
	login = requests.get(BASEURL + "/auth/login?username=<USERNAME>&password=<PASSWORD>", verify=False)
	#print(login.cookies["SID"])
	assert login.cookies["SID"] is not None
except Exception as e:
	# do something (maybe ping telegram?)
	raise e


# Get all torrents
try:
	r = requests.get(BASEURL + "/torrents/info?filter=resumed", headers={"Cookie": "SID={}".format(login.cookies["SID"])}, verify=False)
except Exception as e:
	# do something
	raise e


if r.status_code != 200:
	#do something (maybe ping telegram?)
	sys.exit()

# Find non-private tagged torrents
hitlist = []
for x in r.json():
	if "private" not in x["tags"] and x["state"] != "downloading" and x["state"] != "stalledDL":
		hitlist.append(x["hash"])

if len(hitlist) == 0:
	sys.exit()

# Pause them
try:
	p = requests.get(BASEURL + "/torrents/pause?hashes={}".format("|".join(hitlist)) , headers={"Cookie": "SID={}".format(login.cookies["SID"])}, verify=False)
except Exception as e:
	# do something (maybe ping telegram?)
	raise e

if r.status_code != 200:
	raise Exception("Failed to pause torrents")
