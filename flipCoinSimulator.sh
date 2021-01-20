#! /bin/bash 

function simulateCoinFlip
{
echo $((RANDOM%2))
}

declare -A dict
dict[0]=TAILS
dict[1]=HEADS

function findWinner
{
count_heads=0
count_tails=0
while [ $count_heads -lt 21 -a $count_tails -lt 21 ]
do
	result=$(simulateCoinFlip)
	#printf ${dict[$result]}
	case $result in
		0)count_tails=$((count_tails+1)) ;;
		1)count_heads=$((count_heads+1)) ;;
	esac
done
echo $((count_heads-count_tails))
}


function getWinner
{
diff=$1
if [ $diff -gt 0 ]
then
	echo "Heads won by $diff toss"
elif [ $diff -lt 0 ]
then
	echo "Tails won by  $((diff*-1)) toss"
fi
}

#Main
diff=$(findWinner)
#diff=0 #for checking tie condition
if [ $diff -eq 0 ]
then
	while [ $diff -lt 2 ]
	do
		echo "Tied !!! Drawing again difference is : $diff"
		diff=$(findWinner)
        	diff=${diff#-} #taking absoulte value
	done
	echo $(getWinner $diff)
else
	echo $(getWinner $diff)

fi
