#!/bin/bash

echo "Starting the mosquitto server now ..."
# cd into where my repo is
./src/mosquitto -c mosquitto.conf -v

# TODO: also run something like tshark or tcpdump?