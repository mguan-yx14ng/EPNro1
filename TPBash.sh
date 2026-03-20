#!/bin/bash
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
}

opcion_2() {
    if [ -f ~/EPNro1/$FILENAME ];then
        bash ~/EPNro1/consolidar.sh
    else
        touch ~/EPNro1/salida/$FILENAME
        bash ~/EPNro1/consolidar.sh
    fi
}

opcion_4() {
    if [ -f ~/EPNro1/salida/$FILENAME ]; then
        sort -k5 -n -r ~/EPNro1/salida/$FILENAME | head -n 10
    else
        echo "No existe FILENAME.txt en salida"
    fi
}

export FILENAME="FILENAME.txt"

opcion = " "

while [[ ! $opcion -eq "-d"]] do
    echo -n"$menu"
    read opcion

    if [ $opcion -eq 1 ]; then
        opcion_1
    elif [ $opcion -eq 2 ]; then
        opcion_2
    fi

done
