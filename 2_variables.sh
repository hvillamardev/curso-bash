# !/bin/bash
# Programa para revisar la declaracion de variables

opcion=0
nombre=Hilario

echo "Opcion: $opcion y Nombre: $nombre"

#Exportar la variable nombre para que este disponible en los demas procesos

export nombre

#llamar al sig scrip

./2_variables2.sh
