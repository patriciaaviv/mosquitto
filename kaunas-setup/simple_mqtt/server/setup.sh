#!/bin/bash

hn=$(pos_get_variable hostname)
a_global_variable=$(pos_get_variable a/global/variable --from-global)
a_local_variable=$(pos_get_variable a/local/variable)

echo "Setting up server node ..."
echo "hostname is $hn according to pos"

echo "starting mosquitto server ..."

# clone git repo
repository="git@github.com:patriciaaviv/mosquitto.git"
# which folder is mine on the test node?
localFolder="/Users/horvathp/"
git clone "$repository" "$localFolder"

# compile the files
make ~/horvathp/mosquitto



