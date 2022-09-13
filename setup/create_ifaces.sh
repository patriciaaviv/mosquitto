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
# Create 1024 new addresses since this is the maximum number of connections to the MQTT broker
for VARIABLE in {2..254}
do
  IP_ADDR_1="192.168.1.$VARIABLE"
  ip addr add "$IP_ADDR_1/24" dev $VETH1
done

for VARIABLE in {1..254}
do
  IP_ADDR_2="192.168.2.$VARIABLE"
  ip addr add "$IP_ADDR_2/24" dev $VETH1
done

for VARIABLE in {1..254}
do
  IP_ADDR_3="192.168.3.$VARIABLE"
  ip addr add "$IP_ADDR_3/24" dev $VETH1
done

for VARIABLE in {1..254}
do
  IP_ADDR_4="192.168.4.$VARIABLE"
  ip addr add "$IP_ADDR_4/24" dev $VETH1
done

for VARIABLE in {1..254}
do
  IP_ADDR_5="192.168.5.$VARIABLE"
  ip addr add "$IP_ADDR_5/24" dev $VETH1
done

for VARIABLE in {1..9}
do
  IP_ADDR_6="192.168.6.$VARIABLE"
  ip addr add "$IP_ADDR_6/24" dev $VETH1
done

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