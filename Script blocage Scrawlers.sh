#!/bin/bash

#Backup Des donnees d'access_log :

cp --backup /var/log/apache2/access.log

#L'usage des cran par les log :

cd /var/log/apache2/

cat access.log

do crontab -l;

#Tous les adresses clients renvoyant 404 erreurs(qui ont rencontré des scrawlers)(
do
#Script du blocage de scrawlers :

awk '($9 ~ /404/)' /var/log/apache2/access.log | awk '{print $9,$7}' | sort | sed -n '/404$/p'| awk '{print $1}' |tail -f |iptables -A INPUT -s $1 -j DROP

done