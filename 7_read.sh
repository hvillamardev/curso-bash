# ! /bin/bash
#Programa para ejemplificar como capturar la informacion del usuario utilizando el comando echo, read y $REPLY
#Autor: Hilario Villamar

option=0
backupName=''

echo 'Programa utilidades Postgres'
echo -n 'Ingresar un opcion:'
read
option=$REPLY
echo -n 'Ingresar el nombre del archivo del backup:'
read
backupName=$REPLY
echo "Opcion:$option. backupNmae:$backupName"
