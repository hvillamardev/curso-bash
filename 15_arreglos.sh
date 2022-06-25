# ! /bin/bash
# Programa para uso de arreglo
# Author: Hilario Villamar

arregloNum=(1 2 3 4 5 6)
arregloString=(Diego, Andres, Mariana, Beatriz)
arregloRango=({A..Z} {10..20})

#imprimir valores
echo "Arreglo números: ${arregloNum[*]}"
echo "Arreglo cadenas: ${arregloString[*]}"
echo "Arreglo rangos: ${arregloRango[*]}"

#imprimiendo y tamaños

echo "Tamaño Arreglo números: ${#arregloNum[*]}"
echo "Tamaño Arreglo cadenas: ${#arregloString[*]}"
echo "Tamaño Arreglo rangos: ${#arregloRango[*]}"

#imprimir la posición 3 del los arreglos

echo "Pos 3 Arreglo números: ${arregloNum[3]}"
echo "Pos 3 Arreglo cadenas: ${#arregloString[3]}"
echo "Pos 3 Arreglo rangos: ${#arregloRango[3]}"

#Añadir y eliminar valores en un arreglo

arregloNum[7]=20
unset arregloNum[0]
echo "Arreglo numeros: ${arregloNum[*]}"
echo "Tamaño arreglo numeros: ${#arregloNum[*]}"