#!/bin/bash

echo "adding bridges"
echo "building AB"

sudo brctl addbr brAB
# clients
# sudo brctl addbr brA
sleep 0.5

echo "building BC"
sudo brctl addbr brBC
# clients
# sudo brctl addbr brB
sleep 0.5

echo "building CE"
sudo brctl addbr brCE
# clients
# sudo brctl addbr brC
sleep 0.5

echo "building ED"
sudo brctl addbr brED
# clients
# sudo brctl addbr brD
sleep 0.5

# echo "building E"
# clients
# sudo brctl addbr brE
# sleep 0.5

echo "Uppging bridges between buildings..."
sudo ip link set brAB up
sleep 0.1
sudo ip link set brBC up
sleep 0.1
sudo ip link set brCE up
sleep 0.1
sudo ip link set brED up
sleep 0.1

# echo "Upping bridges for clients..."
# sudo ip link set brA up
# sleep 0.1
# sudo ip link set brB up
# sleep 0.1
# sudo ip link set brC up
# sleep 0.1
# sudo ip link set brD up
# sleep 0.1
# sudo ip link set brE up

echo "Upping bridges to each building"
sudo virsh net-start default
sleep 0.1
sudo virsh net-start networkA
sleep 0.1
sudo virsh net-start networkB
sleep 0.1
sudo virsh net-start networkC
sleep 0.1
sudo virsh net-start networkE
sleep 0.1
sudo virsh net-start networkD
sleep 0.1
echo "Done!"
