# ! /bin/bash
#Programa para revisar como ejecutar comando dentro de un programa y almacenar en una variable para su posterior utilizacion
#Autor: Hilario Villamar

ubicacionActual=$(pwd)
infoKernel=$(uname -a)

echo "La ubicacion actual es la siguiente: $ubicacionActual" 
echo "La informacion del Kernel: $infoKernel"
