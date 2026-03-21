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
    echo "Se ha creado el ambiente."
}

opcion_2() {
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

export FILENAME="FILENAME"

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
        -d)
            #aca va el la funcion que borrara las carpetas entrada, salida, procesado con todo el contenido
            ;;
        *)
            echo "Opcion invalida, por favor elija una opcion de las mostradas"
            ;;
    esac
done

echo "Script Cerrado"