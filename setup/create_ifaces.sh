#!/bin/bash
echo 'Setting up the virtual interfaces ...'

# Create virtual bridge br-virt, execute with sudo
BRIDGE="br-virt"
ip link add $BRIDGE type bridge

# Create virtual interfaces
VETH0="dummy0"
VETH1="dummy1"

ip link add $VETH0 type dummy
ip link add $VETH1 type dummy

# Add interfaces as bridge's slave
ip link set $VETH0 master $BRIDGE
ip link set $VETH1 master $BRIDGE

# TODO: conditional for testing

# Assign IP addresses to the new interfaces
ip addr add 192.168.1.1/24 dev $VETH0
ip addr add 192.168.1.2/24 dev $VETH1

ip link set dev $VETH0 up
ip link set dev $VETH1 up

# TODO: conditional for testing

echo 'Set up is done'