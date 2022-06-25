# !/bin/bash
#Programa para ejemplificar el uso de la sentencia de decision if, else 
#Autor: Hilario Villamar

# OPERADORES RELACIONALES
# -eq: is equal to // Igual a
# -ne: is not equal to // No es igual a
# -gt: is greater than // Mayor a
# -ge: is greater than or equal to // Mayor o igual a
# -lt: is less than // Menor a
# -le: is less than or equal to // Menor o igual a

edad=0

echo "EJEMPLO SENTENCIA IF/ELIF/ELSE"
read -p "Introduzca su edad: " edad

if [ $edad -le 0 ]; then
    echo "La persona aun no ha nacido, ni falta que le hace"
elif [ $edad -ge 1 ] && [ $edad -le 13 ]; then
    echo "Es un niño"
elif [ $edad -le 18 ]; then
    echo "La persona es adolescente"
elif [ $edad -ge 19 ] && [ $edad -le 64 ]; then
    echo "La persona es adulta"
elif [ $edad -ge 65 ] && [ $edad -le 90 ]; then
    echo "La persona es bastante mayor ya"
else
    echo "La persona es un dinosaurio"
fi