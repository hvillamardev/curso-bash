# ! /bin/bash
#Programa para ejemplificar como capturar la informacion del usuario y validar
#Autor: Hilario Villamar

option=0
backupName=''
clave=''

echo 'Programa utilidades Postgres'
# Acepta el ingreso de informacion de solo un caracter
read -n1 -p 'Ingresar un opcion:' option
echo -e '\n'
read -n10 -p 'Ingresar el nombre del archivo del backup:' backupName
echo -e '\n'
echo "Opcion:$option. backupNmae:$backupName"
read -s -p 'Clave:' clave
echo 'Clave: ' $clave