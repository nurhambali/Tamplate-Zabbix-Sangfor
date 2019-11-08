#!/bin/bash

a3="$2" #FreeMemory
a4="$3" #TotalMemory
#a3="" #TotalMemory
a5="$1"
a1=`snmpwalk -v 2c -c $a5 $a3`
b1=`echo $a1 |awk -F"STRING:" '{print $2}'`
c1=`echo -n $b1 |awk '{gsub(/ MB/,""); print}'`
d1=`echo  -n $c1 |awk '{gsub(/"/,""); print}'`
e1=`echo  -n $d1 |awk '{gsub(/\./,""); print}'`
a2=`snmpwalk -v 2c -c $a5 $a4`
b2=`echo $a2 |awk -F"STRING:" '{print $2}'`
c2=`echo -n $b2 |awk '{gsub(/ MB/,""); print}'`
d2=`echo  -n $c2 |awk '{gsub(/"/,""); print}'`
e2=`echo  -n $d2 |awk '{gsub(/\./,""); print}'`

if [ -n "$a4" ]; then
let a=$((e2-e1))
echo $((a*10000))
else
echo "$(($e1*10000))"
fi
