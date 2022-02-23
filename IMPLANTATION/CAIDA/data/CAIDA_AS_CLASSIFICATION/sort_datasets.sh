#!/bin/bash

#########################################################################################
# SCRIPT QUI sort LES DATASETS de manière lexicographoque (obligé pour utiliser `comm`) #
#########################################################################################


list_files=$(ls | grep "^2.*\.as.*txt")

if [[ -n "$1" ]] && [[ "$1" != '-h' ]];
then
  echo "argument optionnel \$1 must be '-h'" && exit 1
fi

for line in ${list_files}; do
  cat $line | sort $1 -o $line $line
done

