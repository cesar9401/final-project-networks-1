#!/bin/bash

echo "adding routes"
sudo ip route add 200.200.202.0/30 via 200.200.204.1 dev enp1s0
sudo ip route add 200.200.201.0/30 via 200.200.204.1 dev enp1s0
sudo ip route add 200.200.200.0/30 via 200.200.204.1 dev enp1s0

# clients
echo "clients configuration"
# 10.10.150.0/24
sudo ip route add 10.10.150.0/24 via 200.200.204.1 dev enp1s0

# 10.10.151.0/24
sudo ip route add 10.10.151.0/24 via 200.200.204.1 dev enp1s0

# 10.10.152.0/24
sudo ip route add 10.10.152.0/24 via 200.200.204.1 dev enp1s0

# 10.10.153.0/24
sudo ip route add 10.10.153.0/24 via 200.200.204.1 dev enp1s0

# 10.10.154.0/24

sleep 0.5
echo "done!"
