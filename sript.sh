#!/bin/bash

cd "$(dirname "$0")"  

if [ -f "dataset_final" ]; then  
    cd dataset_final  
    ls -l  
else
    echo "Error: dataset_final not found."  
fi