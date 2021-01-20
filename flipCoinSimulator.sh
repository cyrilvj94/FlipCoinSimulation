#! /bin/bash

function simulateCoinFlip
{
echo $((RANDOM%2))
}
count_heads=0
count_tails=0
declare -A dict
dict[0]=TAILS
dict[1]=HEADS
for((i=0;i<100;i++))
do
	result=$(simulateCoinFlip)
	echo ${dict[$result]}
	case $result in
		0)count_tails=$((count_tails+1)) ;;
		1)count_heads=$((count_heads+1)) ;;
	esac
done
echo "head count" $count_heads
echo "tails count" $count_tails
