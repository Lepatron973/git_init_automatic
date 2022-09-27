#!/bin/bash

url_tester(){
	echo "Quel est l'url du dépôt ?"
	read url
	git remote add "origin" $url
	git ls-remote
	if [[ $? != 0 ]]
		then
			echo "L'url entrée est incorrecte, celle-ci a donc été supprimée"
			echo "voulez-vous essayer une autre url ?[yes/no]"
			git remote remove "origin"
			read re_test
			if [[ $re_test == "yes" ]]
				then
					url_tester
				else
					return 1
			fi
		else
			return 0
	fi

}
