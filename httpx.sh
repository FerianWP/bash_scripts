#!/bin/bash

echo "Enter a target: "

read target

httpx-toolkit -l "$HOME/Desktop/bash_scripts/Targets/${target}/resolveddomains.txt" -t 75 -silent -sc -title -td  | anew "$HOME/Desktop/bash_scripts/Targets/${target}/httpx.txt" | notify -silent -bulk -id webserver-info