#!/bin/bash

sudo iptables -F
sleep 1

# clientes que salen
sudo iptables -A FORWARD -i enp7s0 -s 10.10.154.16 -d 10.10.152.7 -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.154.17 -d 10.10.152.7 -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.154.15 -d 10.10.153.20 -j ACCEPT
sleep 0.5

# established, related
# C
sudo iptables -A FORWARD -i enp7s0 -s 10.10.154.15 -d 10.10.152.7 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.154.15 -d 10.10.152.8 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.154.15 -d 10.10.152.9 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.154.15 -d 10.10.152.10 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.154.15 -d 10.10.152.11 -m state --state ESTABLISHED,RELATED -j ACCEPT
sleep 0.5

# E
sudo iptables -A FORWARD -i enp7s0 -s 10.10.154.19 -d 10.10.153.13 -m state --state ESTABLISHED,RELATED -j ACCEPT
sleep 0.5

# reject
sudo iptables -A FORWARD -i enp7s0 -j REJECT
sleep 0.5
