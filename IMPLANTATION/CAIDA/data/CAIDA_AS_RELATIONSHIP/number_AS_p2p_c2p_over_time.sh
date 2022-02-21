#/bin/bash

# Robustesse : on supprime le fichier qui va être recrée
echo "timestamp,number_AS,number_p2p_links,number_p2c_links" > number_AS_p2p_c2p_over_time.txt

array=$(ls | grep "^[0-9][0-9]*")
for line in $array
do
  num_AS=$(cat $line | grep "^[0-9][0-9]*" | awk -F "|" '{ print $1 "\n" $2 }' | sort -h | uniq  | wc -l) && num_p2p=$(cat $line | grep "0" | wc -l) && num_p2c=$(cat $line | grep "\-1" | wc -l) && time_stamp=$(echo $line | cut -d "." -f 1) && echo ${time_stamp},${num_AS},${num_p2p},${num_p2c} >> number_AS_p2p_c2p_over_time.txt
done
