#!/bin/bash

CLIENT=$1

if [ -z $1 ]
then
    echo "Se esperaba: A | B | C | D | E"
    exit 1
fi

if [ $CLIENT = "-a" ]
then
    echo "routing client $CLIENT"
    # 200.200.200.0/30
    sudo ip route add 200.200.200.0/30 via 10.10.150.1 dev enp7s0
    # 200.200.201.0/30
    sudo ip route add 200.200.201.0/30 via 10.10.150.1 dev enp7s0 
    # 200.200.202.0/30
    sudo ip route add 200.200.202.0/30 via 10.10.150.1 dev enp7s0
    # 200.200.204.0/30
    sudo ip route add 200.200.204.0/30 via 10.10.150.1 dev enp7s0

    exit 0
fi

if [ $CLIENT = "-b" ]
then
    echo "routing client $CLIENT"
    # 200.200.200.0/30
    sudo ip route add 200.200.200.0/30 via 10.10.151.1 dev enp7s0
    # 200.200.201.0/30
    sudo ip route add 200.200.201.0/30 via 10.10.151.1 dev enp7s0
    # 200.200.202.0/30
    sudo ip route add 200.200.202.0/30 via 10.10.151.1 dev enp7s0
    # 200.200.204.0/30
    sudo ip route add 200.200.204.0/30 via 10.10.151.1 dev enp7s0

    exit 0
fi

if [ $CLIENT = "-c" ]
then
    echo "routing client $CLIENT"
    # 200.200.200.0/30
    sudo ip route add 200.200.200.0/30 via 10.10.152.1 dev enp7s0
    # 200.200.201.0/30
    sudo ip route add 200.200.201.0/30 via 10.10.152.1 dev enp7s0
    # 200.200.202.0/30
    sudo ip route add 200.200.202.0/30 via 10.10.152.1 dev enp7s0
    # 200.200.204.0/30
    sudo ip route add 200.200.204.0/30 via 10.10.152.1 dev enp7s0

    exit 0
fi

if [ $CLIENT = "-e" ]
then
    echo "routing client $CLIENT"
    # 200.200.200.0/30
    sudo ip route add 200.200.200.0/30 via 10.10.153.1 dev enp7s0
    # 200.200.201.0/30
    sudo ip route add 200.200.201.0/30 via 10.10.153.1 dev enp7s0
    # 200.200.202.0/30
    sudo ip route add 200.200.202.0/30 via 10.10.153.1 dev enp7s0
    # 200.200.204.0/30
    sudo ip route add 200.200.204.0/30 via 10.10.153.1 dev enp7s0

    exit 0
fi

if [ $CLIENT = "-d" ]
then
    echo "routing client $CLIENT"
    # 200.200.200.0/30
    sudo ip route add 200.200.200.0/30 via 10.10.154.1 dev enp7s0
    # 200.200.201.0/30
    sudo ip route add 200.200.201.0/30 via 10.10.154.1 dev enp7s0
    # 200.200.202.0/30
    sudo ip route add 200.200.202.0/30 via 10.10.154.1 dev enp7s0
    # 200.200.204.0/30
    sudo ip route add 200.200.204.0/30 via 10.10.154.1 dev enp7s0

    exit 0
fi

echo "opcion no valida"
exit 1
