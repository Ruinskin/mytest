#!/bin/bash
read -p "input count down time(min):" m
#echo "$m:00"
let m=$m-1
while [ $m -ge 0 ]
do
  for S in {59..00}
  do
    echo -ne "$m:$S\r"
    sleep 0.1
  done
  let m=$m-1
done
