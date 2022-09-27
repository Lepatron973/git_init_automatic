#!/bin/bash
# initialisation de fonctions
. $HOME/epitech/git_init_automatic/fonctions.sh
# Début du script

echo "Le programme doit créer un dossier où initialiser le dépôt git"
echo "Quel est le nom du dossier que vous voulez créer ?"
read dir_name
if [ -d ./$dir_name ]
	then
		echo "le dossier existe déjà, voulez-vous entrer à l'intérieur de celui-ci [yes/no]?"
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
if  ( url_tester )
	then
		if ! ( pull_tester )
			then
				echo "init" > readme.md
				git add .
				git commit -m "first commit"
				git push --set-upstream "origin" "master"
			else
				echo "pull réussi"				
		fi
	else
		echo "Le dossier n'a pas pu être initialisé correctement"
fi
