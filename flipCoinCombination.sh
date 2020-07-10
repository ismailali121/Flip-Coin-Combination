#!/bin/bash -x
declare -A singletDictionary
read -p "Enter how many times you want to flip coin : " noOfFlips
headHeadCount=0
headTailCount=0
tailHeadCount=0
tailTailCount=0
for((i=0;i<$noOfFlips;i++))
do
        result=$((RANDOM%4))
        if [ $result = 0 ]
        then
                ((headHeadCount++))
                echo HEAD HEAD
        elif [ $result = 1 ]
        then
                ((headTailCount++))
                echo HEAD TAIL

        elif [ $result = 2]
        then
                ((tailHeadCount++))
                echo TAIL HEAD
        else
                ((tailTailCount++))
                echo TAIL TAIL
        fi
done
headHeadPercentage=`expr $headHeadCount/$noOfFlips | bc -l`
headTailPercentage=`expr $headTailCount/$noOfFlips | bc -l`
tailHeadPercentage=`expr $tailHeadCount/$noOfFlips | bc -l`
tailTailPercentage=`expr $tailTailCount/$noOfFlips | bc -l`
singletDictionary[HH]="$headHeadPercentage"
singletDictionary[HT]="$headTailPercentage"
singletDictionary[TH]="$tailHeadPercentage"
singletDictionary[TT]="$tailTailPercentage"
