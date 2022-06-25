# ! /bin/bash
#Programa para ejemplificar como capturar la informacion del usuario utilizando el comando echo, read y $REPLY
#Autor: Hilario Villamar

# -p: Permite ingresar una frase o prompt antes de pedir el dato.
# -s: Modo Sigiloso. No muestra ningún caracter en la terminal, util para contraseñas o información sensible.
# -n [num]: Permite leer como máximo n caracteres.
# -r: Toma el botón de retroceso o backspace como un caracter y no borra ningun otro caracter previamente escrito.

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
