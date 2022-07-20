#!/bin/bash
#Programa para ejemplificar el uso de ciclos while.
#Autor: Hilario Villamar

numero=1
N=0


read -p "Ingresa el número de repeticiones:" N
while [ $numero -le $N ]
do
      echo "Imprimiendo $numero veces"
      numero=$(( numero + 1 ))
done