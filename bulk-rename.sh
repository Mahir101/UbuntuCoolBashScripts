#!/bin/bash
for file in *.txt; do
    mv "$file" "${file%.txt}.bak"
done


#!/bin/bash
for file in *.txt; do
    mv "$file" "$(date +%Y%m%d%H%M%S)_$file"
done
