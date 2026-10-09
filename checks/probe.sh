#!/bin/sh
# The token endpoint answers a wrong login with the login page's error.
curl -fsS --max-time 10 -d 'username=nobody&password=probe' http://app/token | grep -q 'Incorrect username or password'
