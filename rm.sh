#!/bin/bash
rpm -qa kernel | cat -n
CHECK=$(rpm -qa kernel | wc -l)
read -rp "which kernel you wanna remove? " NUM
while [ "$NUM" -lt "$CHECK" ] || [ "$NUM" -eq "$CHECK" ]; do
        VER=$(rpm -qa kernel | cut -d "-" -f 2,3 | tr "[:space:]" ":" | cut -d ":" -f "$NUM")
        if sudo dnf remove kernel-core-"$VER" -y &> /dev/null; sudo dnf remove kernel-devel-"$VER" -y &> /dev/null;then
	      echo "====completed!===="
       else
		echo "====Error!===="
 	fi
	break;
done


