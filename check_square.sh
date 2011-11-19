#! /bin/bash

# Submit a HEAD request to get the response headers
# then grep for the Location HTTP header to ensure 
# that the response is a redirect and that the target is correct

curl -s -I square.jobs | grep -q ^Location:\ https://squareup.com/jobs$'\r'

if [ $? -eq 0 ]; then
    echo "OK - http://square.jobs redirects to https://squareup.com/jobs"
    exit 0
else
    echo "CRITICAL - http://square.jobs DOES NOT redirect to https://squareup.com/jobs"
    exit 2
fi
     
#set -o pipefail
#/usr/lib/nagios/plugins/check_http -H web.de -N -e "HTTP/1.1 301 Moved Permanently" -v | grep -q "Location: https://squareup.com/jobs"
#
#if [ $? -eq 0 ]; then
#    echo "OK - http://square.jobs redirects to https://squareup.com/jobs"
#    exit 0
#else
#    echo "CRITICAL - http://square.jobs DOES NOT redirect to https://squareup.com/jobs"
#    exit 2
#fi
