#!/bin/bash
baseDir="$HOME/Desktop/bash_scripts/Targets"

if [[ -d "$baseDir" ]] 
then
    for dir in "$baseDir"/*/ 
    do
        if [[ -f "${dir}/alldomains.txt" ]]
        then
            programName=$(basename "$dir")
            echo "Resolving domains for $programName: "
            dnsx -dL "${dir}/alldomains.txt" -silent | anew "${dir}/alldomains.txt" | notify -silent -bulk
        else 
            programName=$(basename "$dir")
            echo "No domains to resolve for $programName!"
        fi
    done
else
    echo "Directory '$baseDir' does not exist."
fi
