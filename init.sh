#!/bin/bash
# initialisation de fonctions
. fonctions.sh
# Début du script
echo "Le programme doit créer un dossier où initialiser le dépôt git"
echo "Quelle est le nom du dossier que vous voulez créer ?"
read dir_name
if [ -d ./$dir_name ]
	then
		echo "le dossier existe déja, voulez vous entrer à l'intérieur de celui-ci [yes/no]?"
		read go_dir
		if [[ $go_dir == "yes" ]]
			then
				echo "déplacement dans le dossier $dir_name"
				cd $dir_name
			else
				return
		fi
else
	echo "création du dossier $dir_name"
	mkdir $dir_name
	echo "déplacement dans le dossier $dir_name"
	cd $dir_name
fi
git init
url=$(git remote)
if [[ -n $url ]]
	then
		
		if ( pull_tester $url )
			then
				return
		fi

else
	echo "Quel est l'url du dépôt ?"
	read url
	if ! ( pull_tester $url )
		then
			echo "init" > readme.md
			git add .
			git commit -m "first commit"
			git remote add "origin" $url
			git push --set-upstream "origin" "master"
		else
			echo "le dossier est créé et le git initialisé mais l'url distant était incorrecte"
			
	fi
fi
 
