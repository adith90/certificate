#!/bin/bash
date=$(date +%s)
#find /etc/kubernetes/pki/ -type f -name "*.crt" -print|egrep -v 'ca.crt$'|xargs -L 1 -t  -i bash -c 'openssl x509  -noout -text -in {}|grep After' >cert.txt
#echo "ignore above output"
#expiry=`cat cert.txt | awk -F " " 'NR==1{print $4,$5,$6,$7,$8}'`
expiry=$(date -d "2023-01-26" +%s)
diff=`expr $expiry - $date`
days_remain=`expr $diff / 86400`
if [ $diff -lt 1296000 ]; then
   echo "certificate dew for renewal in $days_remain"
   echo "Need to renew certificate"
   exit 1
else
   echo "certification is valid"
   echo "certificate remaining days= $days_remain"
fi
