#!/usr/bin/env bash

regex='^[-+]*[0-9]+\.*[0-9]*\s[-+*/^]\s[-+]*[0-9]+\.*[0-9]*$'

echo "Welcome to the basic calculator!" | tee operation_history.txt

while true; do
    echo "Enter an arithmetic operation or type 'quit' to quit:" | tee -a operation_history.txt
    read input
    echo "$input" >> operation_history.txt

    if [[ "$input" = "quit" ]]; then
        echo "Goodbye!" | tee -a operation_history.txt
        break
    else
        if [[ "$input" =~ $regex ]]; then
            echo "scale=2; $input" | bc -l | tee -a operation_history.txt
        else
            echo "Operation check failed!" | tee -a operation_history.txt
        fi
    fi
done