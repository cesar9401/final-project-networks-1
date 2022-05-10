#!/bin/bash

echo "Downing bridges between buildings..."
sudo ip link set brAB down
sleep 0.1
sudo ip link set brBC down
sleep 0.1
sudo ip link set brCE down
sleep 0.1
sudo ip link set brED down
sleep 0.1

# echo "Downing bridges for clients..."
# sudo ip link set brA down
# sleep 0.1
# sudo ip link set brB down
# sleep 0.1
# sudo ip link set brC down
# sleep 0.1
# sudo ip link set brD down
# sleep 0.1
# sudo ip link set brE down
# sleep 0.1

echo "Deleting bridges"
sudo brctl delbr brAB
sleep 0.1
sudo brctl delbr brBC
sleep 0.1
sudo brctl delbr brCE
sleep 0.1
sudo brctl delbr brED
sleep 0.1

# bridges for clients
# sudo brctl delbr brA
# sleep 0.1
# sudo brctl delbr brB
# sleep 0.1
# sudo brctl delbr brC
# sleep 0.1
# sudo brctl delbr brD
# sleep 0.1
# sudo brctl delbr brE
echo "Done!"
