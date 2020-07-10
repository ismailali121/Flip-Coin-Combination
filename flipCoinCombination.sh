#!/bin/bash
declare -A dictionary
read -p "Enter how many times you want to flip coin : " noOfFlips

headCount=0
tailCount=0

headHeadCount=0
headTailCount=0
tailHeadCount=0
tailTailCount=0

HHH_Count=0
HHT_Count=0
HTH_Count=0
THH_Count=0
TTH_Count=0
THT_Count=0
HTT_Count=0
TTT_Count=0

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

        elif [ $result = 2 ]
        then
                ((tailHeadCount++))
                echo TAIL HEAD
        else
                ((tailTailCount++))
                echo TAIL TAIL
        fi
done

for((i=0;i<$noOfFlips;i++))
do
        result=$((RANDOM%8))
        if [ $result = 0 ]
        then
                ((HHH_Count++))
                echo HEAD HEAD HEAD
        elif [ $result = 1 ]
        then
                ((HHT_Count++))
                echo HEAD HEAD TAIL

        elif [ $result = 2 ]
        then
                ((HTH_Count++))
                echo HEAD TAIL HEAD
        elif [ $result = 3 ]
        then
                ((THH_Count++))
                echo TAIL HEAD HEAD
        elif [ $result = 4 ]
        then
                ((TTH_Count++))
                echo TAIL TAIL HEAD
        elif [ $result = 5 ]
        then
                ((THT_Count++))
                echo TAIL HEAD TAIL
        elif [ $result = 6 ]
        then
                ((HTT_Count++))
                echo HEAD TAIL TAIL
        else
                ((TTT_Count++))
                echo TAIL TAIL TAIL
        fi
done
headPercentage=`expr $headCount/$noOfFlips | bc -l`
tailPercentage=`expr $tailCount/$noOfFlips | bc -l`

headHeadPercentage=`expr $headHeadCount/$noOfFlips | bc -l`
headTailPercentage=`expr $headTailCount/$noOfFlips | bc -l`
tailHeadPercentage=`expr $tailHeadCount/$noOfFlips | bc -l`
tailTailPercentage=`expr $tailTailCount/$noOfFlips | bc -l`

HHH_Percentage=`expr $HHH_Count/$noOfFlips | bc -l`
HHT_Percentage=`expr $HHT_Count/$noOfFlips | bc -l`
HTH_Percentage=`expr $HTH_Count/$noOfFlips | bc -l`
THH_Percentage=`expr $THH_Count/$noOfFlips | bc -l`
TTH_Percentage=`expr $TTH_Count/$noOfFlips | bc -l`
THT_Percentage=`expr $THT_Count/$noOfFlips | bc -l`
HTT_Percentage=`expr $HTT_Count/$noOfFlips | bc -l`
TTT_Percentage=`expr $TTT_Count/$noOfFlips | bc -l`

dictionary[H]="$tailPercentage"
dictionary[T]="$tailPercentage"

dictionary[HH]="$headHeadPercentage"
dictionary[HT]="$headTailPercentage"
dictionary[TH]="$tailHeadPercentage"
dictionary[TT]="$tailTailPercentage"

dictionary[HHH]="$HHH_Percentage"
dictionary[HHT]="$HHT_Percentage"
dictionary[HTH]="$HTH_Percentage"
dictionary[THH]="$THH_Percentage"
dictionary[TTH]="$TTH_Percentage"
dictionary[THT]="$THT_Percentage"
dictionary[HTT]="$HTT_Percentage"
dictionary[TTT]="$TTT_Percentage"

sorted=`echo ${dictionary[@]} | awk 'BEGIN{RS=" ";} {print $1}' | sort -nr | head -1`
echo $sorted
maximum=0
for i in ${!dictionary[@]}
do
        condition=`echo "${dictionary[$i]}>$maximum" | bc -l`
        if [ $condition -eq 1 ]
        then
                maximim=${dictionary[$i]}
                maximumIndex=$i
        fi
done
echo $maximumIndex combination has won maximum times

