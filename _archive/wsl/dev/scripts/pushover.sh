#!/bin/bash

curl -s \
  --form-string "token=akgru9uryosfbmy3ord9nnd43obz76" \
  --form-string "user=u3pdtf8uhfx11dhtm5cfqgkc3h6dkc" \
  --form-string "message=$@" \
  https://api.pushover.net/1/messages.json
