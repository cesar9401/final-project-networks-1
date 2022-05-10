#!/bin/bash
file="range.conf"

if [ $1 != "client1" -a $1 != "client2" ]
then
	echo "Argumento invalido, se esperaba: client1 | client2"
	exit 1
fi

if [ -z $2 ]
then
	echo "Se esperaba otro argumento."
	exit 1
fi

if [[ ! -f $file || -z $(cat $file | grep $2) ]]
then
	echo "No se encontro configuracion para el dispositivo $2"
	exit 1
fi

NEW_MAC=$(cat $file | grep $2 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')
VM="debian11-$1"
BR="bridge${2:0:1}"

# echo $VM
# echo $NEW_MAC
# echo $BR

echo "checking device..."
sleep 0.5
OLD_MAC=$(sudo virsh domiflist $VM | grep bridge | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')
if [ ! -z $OLD_MAC ]
then
    echo "Deleting interace with mac $OLD_MAC"
    sleep 0.5
    sudo virsh detach-interface --domain $VM --type bridge --mac $OLD_MAC --current
    sleep 3
fi

echo "adding interface with mac $NEW_MAC"
sleep 0.5
sudo virsh attach-interface --domain $VM --type bridge --source $BR --model e1000e --mac $NEW_MAC --current
sleep 3

echo "done!"
sleep 1
