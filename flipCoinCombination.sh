#!/bin/bash -x
declare -A singletDictionary
read -p "Enter how many times you want to flip coin : " noOfFlips
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
HHH_Percentage=`expr $HHH_Count/$noOfFlips | bc -l`
HHT_Percentage=`expr $HHT_Count/$noOfFlips | bc -l`
HTH_Percentage=`expr $HTH_Count/$noOfFlips | bc -l`
THH_Percentage=`expr $THH_Count/$noOfFlips | bc -l`
TTH_Percentage=`expr $TTH_Count/$noOfFlips | bc -l`
THT_Percentage=`expr $THT_Count/$noOfFlips | bc -l`
HTT_Percentage=`expr $HTT_Count/$noOfFlips | bc -l`
TTT_Percentage=`expr $TTT_Count/$noOfFlips | bc -l`
singletDictionary[HHH]="$HHH_Percentage"
singletDictionary[HHT]="$HHT_Percentage"
singletDictionary[HTH]="$HTH_Percentage"
singletDictionary[THH]="$THH_Percentage"
singletDictionary[TTH]="$TTH_Percentage"
singletDictionary[THT]="$THT_Percentage"
singletDictionary[HTT]="$HTT_Percentage"
singletDictionary[TTT]="$TTT_Percentage"
