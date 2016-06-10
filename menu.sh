#!/bin/bash
## menu.sh for menu in /home/mohamad/Projets/FDI/UNIX/plusoumoins/fahmi_m
## 
## Made by FAHMI Mohamad Kamal
## Login   <fahmi_m@etna-alternance.net>
## 
## Started on  Tue Nov  4 20:13:44 2014 FAHMI Mohamad Kamal
## Last update Wed Nov  5 16:29:41 2014 FAHMI Mohamad Kamal
##

sleep 0.5
valid3=1
echo "Bienvenue, quel est votre nom ?"
while [ $valid3 -ne "0" ];
do
    read -r pseudo
    if [ -z "$pseudo" ]; then
	echo -n "Veuillez préciser un nom : "
    elif [ "$pseudo" == "exit" ]; then
        exit
    else
	valid3=0
    fi
done

sleep 0.5
echo ""
echo "Bonjour $pseudo. Choisissez la difficulté :"
sleep 0.5
echo "1 : Facile (15 coups)"
echo "2 : Intermédiaire (10 coups)"
echo "3 : Difficile (5 coups)"
echo "4 : Hardcore (1 coup)"
echo "5 : Tableau des scores"
echo "6 : Réinitialisez le tableau des scores"
sleep 0.5

valid=1
while [ $valid -ne "0" ];
do
    echo ""
    echo -n "Niveau : "
    read -r niv
    if [ -z "$niv" ]; then
        echo "Je ne comprends pas, réessayez !"
    elif [ "$niv" == "exit" ]; then
        exit
    elif [ "$(echo "$niv" | wc -c)" -gt "18" ]; then
	echo "Je ne comprends pas, réessayez !"
    elif [ "$(echo $niv | grep -E '^[0-9]+$')" ]; then
	if [ $niv -eq "1" ]; then
            i=15
            valid=0
	elif [ $niv -eq "2" ]; then
            i=10
            valid=0
	elif [ $niv -eq "3" ]; then
            i=5
            valid=0
	elif [ $niv -eq "4" ]; then
            i=1
            valid=0
	elif [ $niv -eq "5" ]; then
	    if [ -f ./score.txt ]; then
		echo ""
		echo "PSEUDO | SCORE | NIVEAU | DATE"
		cat score.txt | sort -f
	    else
		echo "Le tableau des scores est vide. À vous de le remplir !"
	    fi
	elif [ $niv -eq "6" ]; then
	    if [ -f ./score.txt ]; then
		rm ./score.txt
		echo "Le tableau des scores a bien été réinitialisé. À vous de le remplir !"
	    fi
	fi
    else
	echo "Je ne comprends pas, réessayez !"
    fi
done
sleep 0.5
