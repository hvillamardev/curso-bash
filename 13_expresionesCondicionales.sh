# ! /bin/bash
# programa para explicar explesiones condicionales 
# Author: Hilario Villamar



edad=0
pais=""
pathArchivo=""

read -p "ingrese edad: " edad
read -p "ingrese su país: " pais
read -p "ingrese el path de su archivo: " pathArchivo

echo -e "\nExpresiones condicionales con números"
if [ $edad -lt 10 ]; then
    echo "la persona es un niño o niña"
elif [ $edad -ge 10 ] && [ $edad -le 17 ]; then
    echo "se trata de un adolecente"
else
    echo "la persona es mayopr de edad"
fi

echo -e "\nExpresiones condicionales con cadenas"
if [ $pais = "EEUU" ]; then
    echo "la persona es americana"
elif [ $pais == "Ecuador" ] || [ $pais = "Colombia" ]; then
    echo "la persona es latina"
else
    echo "no sabemos su nacionalidad"
fi

echo -e "\nExpresiones condicionales con archivos"
if [ -d $pathArchivo ]; then
    echo "El directorio $pathArchivo existe"
else
    echo "El directorio $pathArchivo no existe"
fi