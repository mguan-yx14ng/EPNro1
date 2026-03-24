#!/bin/bash

export FILENAME="FILENAME"

menu="=== Menu ===
1) Crear Entorno
2) Correr proceso
3) Mostrar listado de alumnos
4) Mostrar las 10 notas mas altas
5) Mostrar alumno por patron ingresado
6) Salir
Introduzca su opcion: "

opcion_1() {
    mkdir -p ~/EPNro1
    mkdir -p ~/EPNro1/entrada
    mkdir -p ~/EPNro1/salida
    mkdir -p ~/EPNro1/procesado
    echo "Se ha creado el ambiente."
}

opcion_2() {
    if [[ ! -f ~/EPNro1/consolidar.sh ]]; then
        touch ~/EPNro1/consolidar.sh
        cat <<EOF >> ~/EPNro1/consolidar.sh
            #!/bin/bash

            cat ./entrada/*.txt >> ./salida/${FILENAME}.txt

        mv ./entrada/*.txt ./procesado
EOF
        fi
    if [ -f ~/EPNro1/*.txt ]; then
        if [ -f ~/EPNro1/${FILENAME}.txt ];then
            bash ~/EPNro1/consolidar.sh &
        else
            touch ~/EPNro1/salida/${FILENAME}.txt
            bash ~/EPNro1/consolidar.sh &
        fi
        echo "Se ha procesado el contenido."
    else
        echo "No hay ningun archivo en ENTRADA."
    fi
}


opcion_3() {
    if [ -f ~/EPNro1/salida/$FILENAME ]; then
	sort -k1 -n ~/EPNro1/salida/$FILENAME | cat
    else
	echo "No existe FILENAME.txt en la carpeta salida"
    fi

}


opcion_4() {
    if [ -f ~/EPNro1/salida/$FILENAME ]; then
        sort -k5 -n -r ~/EPNro1/salida/$FILENAME | head -n 10
    else
        echo "No existe FILENAME.txt en la carpeta salida"
    fi
}

opcion_5() {
	read -p "ingrese el numero de padron: " padron
	if [ -f ~/EPNro1/salida/$FILENAME ]; then
		grep "^$padron " ~/EPNro1/salida/$FILENAME
	else 
		echo "no existe FILENAME.txt en la carpeta salida"
	fi
}

opcion_d() {
    rm -rf ~/EPNro1
}

respuesta=""

while [[ $respuesta != "6" ]]; do
    echo "$menu"
    read respuesta
    case $respuesta in
        1)
            opcion_1
            ;;
        2)
            opcion_2
            ;;
        3)
            opcion_3
            ;;
        4)
            opcion_4
            ;;
        5)
            opcion_5
            ;;
        -d)
            opcion_d
            ;;
        *)
            echo "Opcion invalida, por favor elija una opcion de las mostradas"
            ;;
    esac
    echo "Saliendo..."
done

echo "Script Cerrado"