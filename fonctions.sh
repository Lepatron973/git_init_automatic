#!/bin/bash
pull_tester(){
	echo "execution d'un pull sur la branche master"
	git pull 
		if [[ $? == 1 ]] #si il y a erreur lors du pull
			then
				echo "Quel est le nom de la branche"
				read branch_name
				git pull $branch_name
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

url_tester(){
	echo "Quelle est l'url du dépôt git ?"
	read url
	git remote add -t 'master' 'origin' $url
	if [[ $? == 128 ]]
		then
			echo "Le dépôt comporte déjà une url voulez-vous continuer avec l'ancienne url ?[yes/no]"
			read url_go_on
			if [[ $url_go_on != "yes" ]] 
				then 
					git remote remove "origin"
					url_tester
			fi
	fi
	git ls-remote
	if [[ $? == 0 ]]
		then
			return 0
		else
			 echo "L'url entrée est incorrecte voulez-vous en essayer une autre ?[yes/no]"
			 read re_test
			 if [[ $re_test == "yes" ]]
			 	then
					git remote remove "origin"
			 		url_tester
				else
					return 1
			fi

	fi

}
