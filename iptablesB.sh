#!/bin/bash

sudo iptables -F
sleep 0.5

# clientes que salen

sudo iptables -A FORWARD -i enp8s0 -s 10.10.151.5 -d 10.10.150.2 -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.151.5 -d 10.10.150.3 -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.151.5 -d 10.10.150.4 -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.151.6 -d 10.10.150.2 -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.151.6 -d 10.10.150.3 -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.151.6 -d 10.10.150.4 -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.151.6 -d 10.10.153.12 -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.151.6 -d 10.10.153.13 -j ACCEPT
sleep 0.5

# related, established
# E
sudo iptables -A FORWARD -i enp8s0 -s 10.10.151.18 -d 10.10.153.12 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.151.18 -d 10.10.153.14 -m state --state ESTABLISHED,RELATED -j ACCEPT
sleep 0.5

# reject
sudo iptables -A FORWARD -i enp8s0 -j REJECT
sleep 0.5
