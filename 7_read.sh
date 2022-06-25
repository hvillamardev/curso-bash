# ! /bin/bash
#Programa para ejemplificar como capturar la informacion del usuario utilizando el comando read
#Autor: Hilario Villamar

option=0
backupName=''

echo 'Programa utilidades Postgres'
read -p 'Ingresar un opcion:' option
read -p 'Ingresar el nombre del archivo del backup:' backupName
echo "Opcion:$option. backupNmae:$backupName"
