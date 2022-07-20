#!/bin/bash
#Programa que permite manejar las utilidades de Postgres
#Autor= Hilario Villamar

opcion=0
fechaActual=`date +%Y%m%d`

#Funcion para instalar postgres
instalar_postgres () {
    echo -e "\n Verificar instalacion postgres"
    verifyInstall=$(which psql)
    if [ $? -eq 0 ]; then
	    echo -e "\n Postgres ya se encuentra instalado en el equipo"
	else
	    read -s -p "Ingresar contrasenha root" password
	    read -s -p "Ingresar contrasenha a utilizar en postgres" passwordPostgres
	    echo "$password" | apt update
	    echo "$password" | apt-get install postgresql postgresql-contrib
	    sudo postgres psql -C "ALTER USER postgres WITH PASSWORD" '{$passwordPostgres}'
	    echo "$password" | su systemctl enable postgresql.service
   	    echo "$password" | su systemctl start postgresql.service
    fi
	    read -n 1 -s -r -p "PRESIONE [ENTER] para continuar..."
}

#Funcion para desinstalar postgres
desinstalar_postgres () {
        read -n1 -p "Desea realmente desinstalar postgres [S/N]: " confirmar
    	echo -e "\n"
	if [ $confirmar = 'S' ] || [ $confirmar = 's' ]; then
	echo -e "\nDesinstalar postgres..."
	read -s -p "Ingresar contrasenha root: " password
	echo -e "\n"
	echo "$password" | sudo systemctl stop postgresql.service
	echo "$password" | sudo apt-get -y --purge remove postgresq\*
	echo "$password" | sudo rm -rf /etc/postgresql
	echo "$password" | sudo rm -rf /var/lib/postgresql
	echo "$password" | sudo usedel -r postgres
       echo "$password" | sudo groupdel postgresql
	echo -e "\nDesinstalado postgres"
    elif  [ $confirmar = 'N' ] || [ $confirmar = 'n' ]; then
	echo -e "\n"
	read -n 1 -s -r -p "PRESIONE [ENTER] para continuar..."
	else
	echo "opcion ingresada no valida"
    fi        
}
#Funcion para sacar un respaldo
sacar_respaldo () {
    echo "Listar las base de datos"
    sudo -u postgresql psql -c "\l"
    read -p "Elegir las base de datos a respaldar: " bddRespaldo
    echo -e "\n"
    if [ -d "$1" ]; then
	   echo "Establecer permisos directorio"
	   echo "$password" | sudo -S chmod 755 $1
	   echo "Realizando respaldo..."
	   sudo -u postgres pg_dump -Fc $bddRespaldo > "$1/bddRespaldo$fechaActual.bak"
	   echo "Respaldo realizado correctamente en la ubicacion:$1/bddRespaldo$fechaActual.bak"
           read -n 1 -s -r -p "PRESIONE [ENTER] para continuar..."
    else
	echo "El directorio $1 no existe"
fi
}

#Funcion restaurar un respaldo
restaurar_respaldo () {
    echo "Listar respaldos"
    read -p "Ingresar el directorio donde estan los respaldos: " directorioBackup
    ls -la $directorioBackup
    read -p "Elegir el resplado a restaurar" respaldoRestaurar
    echo -e "\n"
    read -p  "Ingrese el nombre de la base de datos destino: " bddDestino
    #verificar si la bdd existe
    verifyBdd=$(sudo -u postgres psql -lqt | cut-d | -f 1 | grep -wq $bddDestino)
    if [ $? -eq 0  ]; then
	echo "Restaurando en la bdd destino: $bddDestino"
    else
	su -u postgres psql -c "create database $bddDestino"
    fi
    if [ -f "$1/$respaldoRestaurar"  ]; then
	echo "Restaurando respaldo ..."
	sudo -u postgres pq_restore -Fc -d $bddDestino "$DirectorioBackup/$respaldoRestaurar"
	echo "Listar la base de datos"
	sudo -u postgres psql -c "\l"
    else
	echo "El respaldo $restaurarRespaldo no existe"
    fi
    read -n 1 -s -r -p "PRESIONE [ENTER] para continuar..."
}

while :
do
    #Limpiar la pantalla
    clear
    #Desplegar el menu de opciones
    echo "#------------------------------------------#"
    echo "#PGUTIL - Programa de Utilidad de Postgres #"
    echo "#------------------------------------------#"
    echo "#              Menu Principal              #"
    echo "#------------------------------------------#"
    echo "# 1. Instalar Postgres                     #"
    echo "# 2. Desinstalar Postgres                  #"
    echo "# 3. Sacar un respaldos                    #"
    echo "# 4. Restaurar respaldo                    #"
    echo "# 5. Salir                                 #"
    echo "#------------------------------------------#"
    #Leer los datos del usuario - capturar informacion
    read -n1 -p "Ingrese una opcion [1-5]:" opcion
    echo -e "\n"

    #Validad la opcion ingresada
    case $opcion in
	1)
	    instalar_postgres
	    sleep 3
	    ;;
	2)
	    desinstalar_postgres
	    sleep 3
	    ;;
        3)
	    sacar_respaldo
            sleep 3
	    ;;
        4)
	    restaurar_respaldo
            sleep 3
	    ;;
        5)
            echo -e "\nSalir del programa"
            exit 0
            ;;
	*)
	    echo -e "\nOpcion no valida"
	    sleep 1
	    ;;
	esac
done```