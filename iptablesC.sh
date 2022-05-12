#!/bin/bash

sudo iptables -F
sleep 1

# clientes que salen
sudo iptables -A FORWARD -i enp8s0 -s 10.10.152.7 -d 10.10.154.15 -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.152.8 -d 10.10.154.15 -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.152.9 -d 10.10.154.15 -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.152.10 -d 10.10.154.15 -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.152.11 -d 10.10.154.15 -j ACCEPT
sleep 0.5

# established, related
# D
sudo iptables -A FORWARD -i enp8s0 -s 10.10.152.7 -d 10.10.154.16 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i enp8s0 -s 10.10.152.7 -d 10.10.154.17 -m state --state ESTABLISHED,RELATED -j ACCEPT
sleep 0.5

# reject
sudo iptables -A FORWARD -i enp8s0 -j REJECT
sleep 0.5
