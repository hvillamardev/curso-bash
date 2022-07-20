#!/bin/bash
# Programa para utilizar Break y Continue
# Hilario Villamar


echo "Sentencias break y continue"
for fil in $(ls)
do
    for nombre in {1..3}
    do
        if [ $fil = "10_download.sh" ]; then
            echo "Se encontro el archivo $fil y por eso se termian el bucle interno"
            echo "************************************************************"
            break;
        elif [[ $fil == 4* ]]; then
            echo "Se encontro el archivo $fil y continua"
            echo "************************************************************"
            continue;
        else
            echo "Nombre archivo:$fil _ $nombre"
        fi
    done
done