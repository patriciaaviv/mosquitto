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

# Create new IP addresses on dummy1
for VARIABLE in {2..254}
do
  IP_ADDR="192.168.1.$VARIABLE"
  ip addr add "$IP_ADDR/24" dev $VETH1
done
#ip addr add 192.168.1.2/24 dev $VETH1
#ip addr add 192.168.1.3/24 dev $VETH1

ip link set dev $VETH0 up
ip link set dev $VETH1 up

# TODO: conditional for testing

# Set up bridge
ifconfig $BRIDGE up
brctl stp $BRIDGE on

# Set up firewall
iptables -A FORWARD -i $VETH0 -o $VETH1 -j ACCEPT
iptables -A FORWARD -o $VETH0 -i $VETH1 -j ACCEPT

echo 'Set up is done'