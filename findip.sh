#!/bin/bash

echo "Enter target DNS"

read dns

ping -c 1 $dns > ~/Desktop/bash_scripts/bash_outputs/ping.txt

# Check if the file exists
if [ -e "$HOME/Desktop/bash_scripts/bash_outputs/ping.txt" ]; then
    # Read the first line and extract information within parentheses
    info=$(head -n 1 $HOME/Desktop/bash_scripts/bash_outputs/ping.txt | grep -oP '\((.*?)\)' | head -n 1 | tr -d '()')
    
    # Check if information within parentheses is found
    if [ -n "$info" ]; then
        echo "The IP address is: $info"
    else
        echo "No information within parentheses found on the first line."
    fi
else
    echo "Error: ping.txt file not found."
fi

