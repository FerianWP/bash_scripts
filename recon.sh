#!/bin/bash

echo "Enter a target DNS"

read dns

ping -c 1 $dns > ~/Desktop/bash_scripts/bash_outputs/recon_ping.txt

# Check if the file exists
if [ -e "$HOME/Desktop/bash_scripts/bash_outputs/recon_ping.txt" ]; then
    # Read the first line and extract information within parentheses
    ip=$(head -n 1 $HOME/Desktop/bash_scripts/bash_outputs/recon_ping.txt | grep -oP '\((.*?)\)' | head -n 1 | tr -d '()')
    
    if [ -n "$ip" ]; then
        echo "The IP address is: $ip"
    else
        echo "No information within parentheses found on the first line."
    fi
else
    echo "Error: recon_ping.txt file not found."
fi

nmap -A -F "$ip" -v > ~/Desktop/bash_scripts/bash_outputs/recon_nmap.txt
gobuster dir -u http://"$dns" -b 301,404 -w /usr/share/wordlists/seclists/Discovery/Web-Content/common.txt > ~/Desktop/bash_scripts/bash_outputs/recon_dir.txt
