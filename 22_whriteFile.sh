# ! /bin/bash
# Programa para escribir en un archivo
# Autor Marco

echo "Escribir en un Archivos"

echo "Valores escritos con el comando echo" >> $1

#adicion multilinea

cat <<EOM >>$1
$2
EOM