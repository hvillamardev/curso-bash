#!/bin/bash
#Programa para crear archivos y directorios

if [ $# -ne 2 ]; then
    echo "El uso correctodel comando es: "
    echo "$0 d directorio_a_Crear"
    echo "$0 f archivo_a_Crear"
else
    if [ $1 = "d" ]; then
        mkdir -m 755 $2
        ls -l $2
        echo -e "\nDirectorio creado correctamente"
    elif [ $1 = "f" ]; then
        touch $2
        ls -l $2
        echo -e "\nArchivo creado correctamente"
    else
        echo -e "\n $1: Opcion invalida"
    fi
fi