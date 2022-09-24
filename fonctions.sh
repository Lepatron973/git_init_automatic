#!/bin/bash
pull_tester(){
	echo "execution d'un pull sur la branche master"
	git pull $1 "master"
		if [[ $? == 1 ]] #si il y a erreur lors du pull
			then
				echo "Quel est le nom de la branche"
				read branch_name
				git pull $1 $branch_name
				if [[ $? != 0 ]]  #si il y a erreur lors du 2ème pull
					then
						echo "le pull n'a pas réussi à être efféctué"
						echo "passage à l'étape d'initialisation"
						return 1
					else
						echo "pull efféctué"
						return 0
				fi
		fi
}
