#!/bin/bash

sudo iptables -F
sleep 0.5

# clientes que salen
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.2 -d 10.10.151.5 -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.3 -d 10.10.151.5 -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.4 -d 10.10.151.5 -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.2 -d 10.10.153.12 -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.3 -d 10.10.153.12 -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.4 -d 10.10.153.12 -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.2 -d 10.10.153.13 -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.3 -d 10.10.153.13 -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.4 -d 10.10.153.13 -j ACCEPT
sleep 0.5

# related, established
# B
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.2 -d 10.10.151.6 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.3 -d 10.10.151.6 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.4 -d 10.10.151.6 -m state --state ESTABLISHED,RELATED -j ACCEPT
sleep 0.5

# E
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.2 -d 10.10.153.14 -m state --state ESTABLISHED,RELATED -j ACCEPT
sleep 0.5

sudo iptables -A FORWARD -i enp7s0 -j REJECT
sleep 0.5
