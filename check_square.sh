#! /bin/sh

curl -s -I square.jobs | grep -q ^Location: https://squareup.com/jobs$'\r'

if [ $? -eq 0 ]; then
    echo "OK - http://square.jobs redirects to https://squareup.com/jobs"
    exit 0
else
    echo "CRITICAL - http://square.jobs DOES NOT redirect to https://squareup.com/jobs"
    exit 2
fi
     


if [ curl -s -I square.jobs | grep -q ^Location: https://squareup.com/jobs$'\r' ]; then
    echo "OK - http://square.jobs redirects to https://squareup.com/jobs"
    exit 0
else
    echo "CRITICAL - http://square.jobs DOES NOT redirect to https://squareup.com/jobs"
    exit 2
fi
#set -o pipefail
#/usr/lib/nagios/plugins/check_http -H square.jobs -N -e "HTTP/1.1 301 Moved Permanently" -v | grep "Location: https://squareup.com/jobs" > /dev/null
#
#if [ $? -eq 0 ]; then
#    echo "OK"
#else
#    echo "CRITICAL"
#fi
