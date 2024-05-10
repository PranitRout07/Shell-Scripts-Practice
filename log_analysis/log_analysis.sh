#!/bin/bash

# For linux
#./log_analysis.sh | wc -l ( it gives by coounting the keyword appears in the log file )

echo "Which keyword you want to analyze: "
read keyword
for file in /var/log/*log*; do
    if [[ $file =~ \.gz$ ]]; then
        zgrep "$keyword" "$file"
    else
        grep "$keyword" "$file"
    fi
done