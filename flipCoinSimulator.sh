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

while [ $count_heads -lt 21 -a $count_tails -lt 21 ]
do
	result=$(simulateCoinFlip)
	echo ${dict[$result]}
	case $result in
		0)count_tails=$((count_tails+1)) ;;
		1)count_heads=$((count_heads+1)) ;;
	esac
done

diff=$((count_heads-count_tails))
echo $count_heads $count_tails
if [ $diff -gt 0 ]
then
	echo "Heads won by $diff" toss
elif [ $diff -lt 0 ]
then
	echo "Tails won by " $((diff*-1)) toss
else
	echo "Draw"
fi
