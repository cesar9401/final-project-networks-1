#!/bin/bash
VM="debian11-client1"
OLD_MAC="52:54:00:f2:9d:33"
NEW_MAC="6e:12:39:bc:a7:4e"
BR="bridgeA"


# FILE="client1.xml"

# dump from VM
# sudo virsh dumpxml $VM > $FILE

# create and turn on VM
# sudo virsh CREATE $FILE

# take effect on the next reboot --config
# sudo virsh detach-interface --domain debian11-1 --type bridge --mac 52:54:00:66:f1:d1 --config
# sudo virsh attach-interface --domain debian11-1 --type bridge --source br1 --model e1000e --mac 52:54:00:66:f1:d2 --config


# take effect on the current domain --current

echo "Deleting interace with mac $OLD_MAC"
sudo virsh detach-interface --domain $VM --type bridge --mac $OLD_MAC --current
# sudo virsh detach-interface --domain $VM --type network --mac $OLD_MAC --current
sleep 3

echo "adding interface with mac $NEW_MAC"
sudo virsh attach-interface --domain $VM --type bridge --source $BR --model e1000e --mac $NEW_MAC --current
sleep 3

echo "sudo virsh domiflist $VM"
sudo virsh domiflist $VM

echo "sudo brctl show"
sudo brctl show


# sudo virsh net-define other_network.xml
# sudo virsh net-list --inactive
# sudo virsh net-autostart network2
# sudo virsh net-start network2
# sudo virsh net-list --all


# ver tabla de enrutamiento
ip route show
route -n
netstat -rn

# ------------- routing
# A <-> C
# on A
sudo ip route add 200.200.201.0/30 via 200.200.200.2 dev enp1s0
# on C
sudo ip route add 200.200.200.0/30 via 200.200.201.1 dev enp1s0

# B <-> E
# on B
sudo ip route add 200.200.202.0/30 via 200.200.201.2 dev enp7s0
# on E
sudo ip route add 200.200.201.0/30 via 200.200.202.1 dev enp1s0

# C <-> D
# on C
sudo ip route add 200.200.204.0/30 via 200.200.202.2 dev enp7s0
# on D
sudo ip route add 200.200.202.0/30 via 200.200.204.1 dev enp1s0

# A <-> E
# on A
sudo ip route add 200.200.202.0/30 via 200.200.200.2 dev enp1s0
# on E
sudo ip route add 200.200.200.0/30 via 200.200.202.1 dev enp1s0

# B <-> D
# on B
sudo ip route add 200.200.204.0/30 via 200.200.201.2 dev enp7s0
# on D
sudo ip route add 200.200.201.0/30 via 200.200.204.1 dev enp1s0

# A <-> D
# on A
sudo ip route add 200.200.204.0/30 via 200.200.200.2 dev enp1s0
# on D
sudo ip route add 200.200.200.0/30 via 200.200.204.1 dev enp1s0

# -------------------------------------- clients 
# ------------- A
# on client
# 200.200.200.0/30
sudo ip route add 200.200.200.0/30 via 10.10.150.1 dev enp7s0
# 200.200.201.0/30
sudo ip route add 200.200.201.0/30 via 10.10.150.1 dev enp7s0 
# 200.200.202.0/30
sudo ip route add 200.200.202.0/30 via 10.10.150.1 dev enp7s0
# 200.200.204.0/30
sudo ip route add 200.200.204.0/30 via 10.10.150.1 dev enp7s0

# on A
# on B
sudo ip route add 10.10.150.0/24 via 200.200.200.1 dev enp1s0 
# on C
sudo ip route add 10.10.150.0/24 via 200.200.201.1 dev enp1s0
# on E
sudo ip route add 10.10.150.0/24 via 200.200.202.1 dev enp1s0
# on D
sudo ip route add 10.10.150.0/24 via 200.200.204.1 dev enp1s0
# ------------- A

# ------------- B
# on client
# 200.200.200.0/30
sudo ip route add 200.200.200.0/30 via 10.10.151.1 dev enp7s0
# 200.200.201.0/30
sudo ip route add 200.200.201.0/30 via 10.10.151.1 dev enp7s0
# 200.200.202.0/30
sudo ip route add 200.200.202.0/30 via 10.10.151.1 dev enp7s0
# 200.200.204.0/30
sudo ip route add 200.200.204.0/30 via 10.10.151.1 dev enp7s0

# on A
sudo ip route add 10.10.151.0/24 via 200.200.200.2 dev enp1s0
# on B
# on C
sudo ip route add 10.10.151.0/24 via 200.200.201.1 dev enp1s0
# on E
sudo ip route add 10.10.151.0/24 via 200.200.202.1 dev enp1s0
# on D
sudo ip route add 10.10.151.0/24 via 200.200.204.1 dev enp1s0
# ------------- B

# ------------- C
# on client
# 200.200.200.0/30
sudo ip route add 200.200.200.0/30 via 10.10.152.1 dev enp7s0
# 200.200.201.0/30
sudo ip route add 200.200.201.0/30 via 10.10.152.1 dev enp7s0
# 200.200.202.0/30
sudo ip route add 200.200.202.0/30 via 10.10.152.1 dev enp7s0
# 200.200.204.0/30
sudo ip route add 200.200.204.0/30 via 10.10.152.1 dev enp7s0

# on A
sudo ip route add 10.10.152.0/24 via 200.200.200.2 dev enp1s0
# on B
sudo ip route add 10.10.152.0/24 via 200.200.201.2 dev enp7s0
# on C
# on E
sudo ip route add 10.10.152.0/24 via 200.200.202.1 dev enp1s0
# on D
sudo ip route add 10.10.152.0/24 via 200.200.204.1 dev enp1s0
# ------------- C

# ------------- E
# on client
# 200.200.200.0/30
sudo ip route add 200.200.200.0/30 via 10.10.153.1 dev enp7s0
# 200.200.201.0/30
sudo ip route add 200.200.201.0/30 via 10.10.153.1 dev enp7s0
# 200.200.202.0/30
sudo ip route add 200.200.202.0/30 via 10.10.153.1 dev enp7s0
# 200.200.204.0/30
sudo ip route add 200.200.204.0/30 via 10.10.153.1 dev enp7s0

# on A
sudo ip route add 10.10.153.0/24 via 200.200.200.2 dev enp1s0
# on B
sudo ip route add 10.10.153.0/24 via 200.200.201.2 dev enp7s0
# on C
sudo ip route add 10.10.153.0/24 via 200.200.202.2 dev enp7s0
# on E
# on D
sudo ip route add 10.10.153.0/24 via 200.200.204.1 dev enp1s0
# ------------- E

# ------------- D
# on client
# 200.200.200.0/30
sudo ip route add 200.200.200.0/30 via 10.10.154.1 dev enp7s0
# 200.200.201.0/30
sudo ip route add 200.200.201.0/30 via 10.10.154.1 dev enp7s0
# 200.200.202.0/30
sudo ip route add 200.200.202.0/30 via 10.10.154.1 dev enp7s0
# 200.200.204.0/30
sudo ip route add 200.200.204.0/30 via 10.10.154.1 dev enp7s0

# on A
sudo ip route add 10.10.154.0/24 via 200.200.200.2 dev enp1s0
# on B
sudo ip route add 10.10.154.0/24 via 200.200.201.2 dev enp7s0
# on C
sudo ip route add 10.10.154.0/24 via 200.200.202.2 dev enp7s0
# on E
sudo ip route add 10.10.154.0/24 via 200.200.204.2 dev enp7s0
# on D
# ------------- D



iptables -A FORWARD -i ens10 -s 10.10.3.2 -d 10.10.5.2 -j ACCEPT
iptables -A FORWARD -i ens10 -j DROP

 i -> intefaz edificio
-s ip de salida
-d ip destino


interface="enp7s0"
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.2 -d 10.10.151.5 -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.3 -d 10.10.151.5 -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -s 10.10.150.4 -d 10.10.151.5 -j ACCEPT
sudo iptables -A FORWARD -i enp7s0 -j DROP





