#!/bin/bash
baseDir="$HOME/Desktop/bash_scripts/Targets"

if [[ -d "$baseDir" ]] 
then
    for dir in "$baseDir"/*/ 
    do
        if [[ -f "${dir}/roots.txt" ]]
        then
            programName=$(basename "$dir")
            echo "Grabbing domains for $programName: "
            subfinder -dL "${dir}/roots.txt" -silent | anew "${dir}/alldomains.txt" | notify -silent -bulk
            # Read each line in "roots.txt" and process it
            while IFS= read -r rootDomain; do
                # Check if the root domain is not empty
                if [ -n "$rootDomain" ]; then
                    echo "Processing root domain: $rootDomain"

                    # Use sublist3r to find subdomains for the current root domain
                    sublist3r -d "$rootDomain" | anew "${dir}/alldomains.txt" | notify -silent -bulk
                fi
            done < "${dir}/roots.txt"

        else 
            programName=$(basename "$dir")
            echo "No root domains found for $programName!"
        fi
    done
else
    echo "Directory '$baseDir' does not exist."
fi
