#!/usr/bin/env bash
# -*- ENCODING: UTF-8 -*-
##
## @author     Raúl Caro Pastorino
## @copyright  Copyright © 2017 Raúl Caro Pastorino
## @license    https://wwww.gnu.org/licenses/gpl.txt
## @email      tecnico@fryntiz.es
## @web        www.fryntiz.es
## @github     https://github.com/fryntiz
## @gitlab     https://gitlab.com/fryntiz
##
##             Guía de estilos aplicada:
## @style      https://github.com/fryntiz/Bash_Style_Guide

############################
##     INSTRUCCIONES      ##
############################

############################
##     IMPORTACIONES      ##
############################

############################
##       CONSTANTES       ##
############################

###########################
##       VARIABLES       ##
###########################

###########################
##       FUNCIONES       ##
###########################
i3wm_dependencias() {
    echo "Instalando Dependencias"
    dependencias="i3 i3status dmenu i3lock xbacklight feh alsamixer nmcli mc links"

    for x in $dependencias
    do
        echo "Instalando $x"
        sudo dnf install -y $x
    done
}

###########################
##       EJECUCIÓN       ##
###########################


i3wm_instalación() {
    i3wm_dependencias
}
