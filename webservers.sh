#!/bin/bash
baseDir="$HOME/Desktop/bash_scripts/Targets"

if [[ -d "$baseDir" ]] 
then
    for dir in "$baseDir"/*/ 
    do
        if [[ -f "${dir}/resolveddomains.txt" ]]
        then
            programName=$(basename "$dir")
            echo "Grabbing webservers for $programName: "
            httpx-toolkit -l "${dir}/resolveddomains.txt" -t 75 -silent | anew "${dir}/livedomains.txt" | notify -silent -bulk -id webservers
           

        else 
            programName=$(basename "$dir")
            echo "No root domains found for $programName!"
        fi
    done
else
    echo "Directory '$baseDir' does not exist."
fi