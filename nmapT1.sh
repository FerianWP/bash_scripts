#!/bin/bash

echo "Enter a target IP"

read IP

nmap -A -F -T1 "$IP" -v > ~/Desktop/bash_scripts/bash_outputs/nmap.txt

