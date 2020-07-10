#!/bin/bash -x
declare -A singletDictionary
read -p "Enter how many times you want to flip coin : " noOfFlips
headCount=0
tailCount=0
for((i=0;i<$noOfFlips;i++))
do
        result=$((RANDOM%2))
        if [ $result = 0 ]
        then
                ((headCount++))
                echo HEADS
        else
                ((tailCount++))
                echo TAILS
        fi
done
singletDictionary[H]="$headCount"
singletDictionary[T]="$tailCount"
headPercentage=`expr ${singletDictionary[H]}/$noOfFlips | bc -l`
tailPercentage=`expr ${singletDictionary[T]}/$noOfFlips | bc -l`
