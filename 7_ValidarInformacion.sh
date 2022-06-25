#!/bin/bash

#capturing user input and validating stuff on it

#ID: can't have more than 10 number and can only be characters 0-9
#Country: can only be in a range of 2 letters (ex: CO, US, EC) is an specific range
#Date of birht: can only be in format yyyyDDMM (ex: 20181222)

#NOTE: regex = regular expression
id_regex='^[0-9]{10}$'		#^beggining $end
country_regex='^EC|CO|US|MX$'
#	              year             month                day
birth_regex='^(19|20)([0-9]{2})(0[1-9]|1[1-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])$'	#the numbers before the [] mean a constant, so therefore in the case of (0[1-9]|1[1-2]) we have N1N2 and N1 can only be 0 or 1 and N2 can be a num from 1-9 if N1 = 0 or 1-2 if = 1
#2010/03/30
echo ""
echo "¬------------------------¬"
echo "Welcome!"
echo "Before passing please enter the following information (mandatory)"

echo ""
read -p "ID: " u_id
read -p "Country of origin [EC, CO, US, MX]: " u_country
read -p "Birth date [yyyyMMDD]: " u_bdate
echo ""

#NOTE: The ~ is actually part of the operator =~ which performs a regular expression match of the string to its left to the extended regular expression on its right
#id validation
if [[ $u_id =~ $id_regex ]]; then
	echo -e "ID ($u_id) - status:\t\t\tAPPROVED"
else
	echo -e "ID ($u_id) - status:\t\t\t\tDENIED (check format)"
fi

#country validation
if [[ $u_country =~ $country_regex ]]; then
	echo -e "Country of origin ($u_country) - status:\t\tAPPROVED"
else
	echo -e "Country of origin ($u_country) - status:\t\tDENIED (check format)"
fi

#birth date validation
if [[ $u_bdate =~ $birth_regex ]]; then
	echo -e "Birth date ($u_bdate) - status:\t\t\tAPPROVED"
else
	echo -e "Birth date ($u_bdate) - status:\t\t\tDENIED (check format)"
fi

echo ""