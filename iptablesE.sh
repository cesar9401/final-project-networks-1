#!/bin/bash

sudo iptables -F
sleep 1

# clientes que salen
sudo iptables -A FORWARD -i enp8s0 -s 10.10.153.14 -d 10.10.150.2 -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.153.12 -d 10.10.151.18 -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.153.14 -d 10.10.151.18 -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.153.13 -d 10.10.154.19 -j ACCEPT
sleep 0.5

# established, related
# A
sudo iptables -A FORWARD -i enp8s0 -s 10.10.153.12 -d 10.10.150.2 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.153.12 -d 10.10.150.3 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.153.12 -d 10.10.150.4 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.153.13 -d 10.10.150.2 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.153.13 -d 10.10.150.3 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.153.13 -d 10.10.150.4 -m state --state ESTABLISHED,RELATED -j ACCEPT
sleep 0.5

# B
sudo iptables -A FORWARD -i enp8s0 -s 10.10.153.12 -d 10.10.151.6 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i enp8s1 -s 10.10.153.13 -d 10.10.151.6 -m state --state ESTABLISHED,RELATED -j ACCEPT
sleep 0.5

# D
sudo iptables -A FORWARD -i enp8s0 -s 10.10.153.20 -d 10.10.154.15 -m state --state ESTABLISHED,RELATED -j ACCEPT
sleep 0.5

# reject
sudo iptables -A FORWARD -i enp8s0 -j REJECT
sleep 0.5
