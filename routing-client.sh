#!/bin/bash

interface=$1
file="/home/cesar/range.conf"

if [[ -z $interface || ! -f $file ]]
then
    echo "No es posible configurar" > building.txt
    exit 1
fi

mac=$(ip a s $interface | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}' | head -n 1)
if [ -z $mac ]
then
    echo "no mac" > building.txt
    exit 1
fi

device=$(cat $file | grep -w $mac | grep -o '[ABCDE][a-z]')
if [ -z $device ]
then
    echo "no client" > building.txt
    exit 1
fi

CLIENT="${device:0:1}"


if [ -Z $CLIENT ]
then
    echo "Se esperaba: A | B | C | D | E"
    exit 1
fi

if [ $CLIENT = "A" ]
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

    # 10.10.151.0/24
    sudo ip route add 10.10.151.0/24 via 10.10.150.1 dev enp7s0
    # 10.10.152.0/24
    # sudo ip route add 10.10.152.0/24 via 10.10.150.1 dev enp7s0
    # 10.10.153.0/24
    sudo ip route add 10.10.153.0/24 via 10.10.150.1 dev enp7s0
    # 10.10.154.0/24
    # sudo ip route add 10.10.154.0/24 via 10.10.150.1 dev enp7s0

    exit 0
fi

if [ $CLIENT = "B" ]
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

    # 10.10.150.0/24
    sudo ip route add 10.10.150.0/24 via 10.10.151.1 dev enp7s0
    # 10.10.152.0/24
    # sudo ip route add 10.10.152.0/24 via 10.10.151.1 dev enp7s0
    # 10.10.153.0/24
    sudo ip route add 10.10.153.0/24 via 10.10.151.1 dev enp7s0
    # 10.10.154.0/24
    # sudo ip route add 10.10.154.0/24 via 10.10.151.1 dev enp7s0

    exit 0
fi

if [ $CLIENT = "C" ]
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

    # 10.10.150.0/24
    # sudo ip route add 10.10.150.0/24 via 10.10.152.1 dev enp7s0
    # 10.10.151.0/24
    # sudo ip route add 10.10.151.0/24 via 10.10.152.1 dev enp7s0
    # 10.10.153.0/24
    # sudo ip route add 10.10.153.0/24 via 10.10.152.1 dev enp7s0
    # 10.10.154.0/24
    sudo ip route add 10.10.154.0/24 via 10.10.152.1 dev enp7s0
    exit 0
fi

if [ $CLIENT = "E" ]
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

    # 10.10.150.0/24
    sudo ip route add 10.10.150.0/24 via 10.10.153.1 dev enp7s0
    # 10.10.151.0/24
    sudo ip route add 10.10.151.0/24 via 10.10.153.1 dev enp7s0
    # 10.10.152.0/24
    # sudo ip route add 10.10.152.0/24 via 10.10.153.1 dev enp7s0
    # 10.10.154.0/24
    sudo ip route add 10.10.154.0/24 via 10.10.153.1 dev enp7s0
    exit 0
fi

if [ $CLIENT = "D" ]
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

    # 10.10.150.0/24
    # sudo ip route add 10.10.150.0/24 via 10.10.154.1 dev enp7s0
    # 10.10.151.0/24
    # sudo ip route add 10.10.151.0/24 via 10.10.154.1 dev enp7s0
    # 10.10.152.0/24
    sudo ip route add 10.10.152.0/24 via 10.10.154.1 dev enp7s0
    # 10.10.153.0/24
    sudo ip route add 10.10.153.0/24 via 10.10.154.1 dev enp7s0
    exit 0
fi

echo "opcion no valida"
exit 1
