#!/bin/bash
## plusoumoins.sh for plusoumoins in /home/mohamad/Projets/FDI/UNIX/plusoumoins/fahmi_m
## 
## Made by FAHMI Mohamad Kamal
## Login   <fahmi_m@etna-alternance.net>
## 
## Started on  Mon Nov  3 10:58:02 2014 FAHMI Mohamad Kamal
## Last update Wed Nov  5 17:39:11 2014 FAHMI Mohamad Kamal
##

nb=$((RANDOM%100))
i=10

clear

source title.sh

source menu.sh

j=$i
valid2=1
while [ $i -gt "0" ] && [ $valid2 -ne "0" ];
do
    echo -n "Entrez un nombre : "
    read -r rep
    if [ -z "$rep" ]; then
	echo "Je ne comprends pas, réessayez !"
    elif [ "$rep" == "exit" ]; then
	exit
    elif [ "$(echo "$rep" | wc -c)" -gt "18" ] && [ "$(echo "$rep" | grep -E '^[0-9]+$')" ]; then
        echo "Vous devez entrer un nombre entre 0 et 100"
    elif [ "$(echo $rep | grep -E '^[0-9]+$')" ]; then
	if [ $rep -lt "0" ] || [ $rep -gt "100" ]; then
	    echo "Vous devez entrer un nombre entre 0 et 100"
	elif [ $rep -lt $nb ]; then
	    ((i=$i-1))
	    if [ $i -gt "0" ]; then
		echo "C'est plus ! Vous avez encore $i chances !"
	    fi
	elif [ $rep -gt $nb ]; then
	    ((i=$i-1))
	    if [ $i -gt "0" ]; then
		echo "C'est moins ! Vous avez encore $i chances !"
	    fi
	elif [ $rep -eq $nb ]; then 
	    echo "Vous avez gagné !"
	    valid2=0
	fi
    else
        echo "Je ne comprends pas, réessayez !"
    fi
done

if [ $j -eq "1" ]; then
    echo "Vous avez utilisé votre unique coup. GAME OVER !!!"
elif [ $i -eq "0" ]; then
    echo "Vous avez utilisé vos $j coups. GAME OVER !!!"
fi
echo -e "Le nombre mystère était \033[1;35m$nb\033[0m."

points=$(($niv * 100 * $i))
date=$(date "+%d-%m-%Y %H:%M:%S")
tab=($pseudo  $points  $niv  ${date[*]});
echo "${tab[0]} | ${tab[1]} | ${tab[2]} | ${tab[3]} ${tab[4]}" >> score.txt

echo 'Si vous voulez recommencer, entrez "oui". Sinon, mettez autre chose.'
read game
if [ "$game" == "oui" ]; then
    ./plusoumoins.sh
fi