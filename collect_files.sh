#!/bin/bash

input_dir="$1"
output_dir="$2"
k=1

find "$input_dir" -type f | while read file; do

    a=$(basename "$file")
    


    if [ -f "$output_dir/$a" ]; then
        
        imy="${a%.*}"
        rash="${a##*.}"
        
        if [ "$rash" != "$imy" ]; then
            a="${imy}_${k}.${rash}"
        else
            a="${imy}_${k}"
        fi
        
        ((k++))
    fi
    
    cp "$file" "$output_dir/$a"
    
done
