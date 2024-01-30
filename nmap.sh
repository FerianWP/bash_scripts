#!/bin/bash

echo "Enter a Target IP"

read IP

nmap -A -F $IP -v > ~/Desktop/bash_scripts/bash_outputs/nmap.txt
