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
bashit_Instalador() {
    if [[ -f ~/.bash_it/bash_it.sh ]] ## Comprobar si ya esta instalado
    then
        echo -e "$VE Ya esta$RO Bash-It$VE instalado para este usuario, omitiendo paso$CL"
        bash ~/.bash_it/install.sh --silent --no-modify-config 2>> /dev/null
    else
        REINTENTOS=5

        echo -e "$VE Descargando Bash-It$CL"
        for (( i=1; i<=$REINTENTOS; i++ ))
        do
            rm -R ~/.bash_it 2>> /dev/null
            git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && bash ~/.bash_it/install.sh --silent && break
        done
    fi

    if [[ -f ~/.nvm/nvm.sh ]] ## Comprobar si ya esta instalado
    then
        echo -e "$VE Ya esta$RO nvm$VE instalado para este usuario, omitiendo paso$CL"
    else
        REINTENTOS=5
        echo -e "$VE Descargando nvm$CL"
        for (( i=1; i<=$REINTENTOS; i++ ))
        do
            rm -R ~/.nvm 2>> /dev/null
            git clone https://github.com/creationix/nvm.git ~/.nvm && ~/.nvm/install.sh && break
        done
    fi

    if [[ -f /bin/fasd ]] ## Comprobar si ya esta instalado
    then
        echo -e "$VE Ya esta$RO fasd$VE instalado, omitiendo paso$CL"
    else
        sudo dnf install fasd
    fi

    ## Instalando dependencias
    echo -e "$VE Instalando dependencias de$RO Bashit$CL"
    sudo dnf install powerline powerline-fonts tmux-powerline vim-powerline powerline-go

    ## Habilitar todos los plugins
    ## TOFIX → Este paso solo puede hacerse correctamente cuando usamos /bin/bash
    plugins_habilitar="alias-completion aws base battery edit-mode-vi explain extract fasd git gif hg java javascript latex less-pretty-cat node nvm postgres projects python rails ruby sshagent ssh subversion xterm dirs nginx plenv pyenv"

    if [[ -n $BASH ]] && [[ $BASH = '/bin/bash' ]]
    then
        echo -e "$VE Habilitando todos los plugins para$RO Bashit$CL"

        ## Incorpora archivo de bashit
        export BASH_IT="/$HOME/.bash_it"
        export BASH_IT_THEME='powerline-multiline'
        export SCM_CHECK=true
        export SHORT_TERM_LINE=true
        source "$BASH_IT"/bash_it.sh

        for p in $plugins_habilitar
        do
            bash-it enable plugin $p
        done

        ## Asegurar que los plugins conflictivos estén deshabilitados:
        echo -e "$VE Deshabilitando plugins no usados en$RO Bashit$CL"
        bash-it disable plugin chruby chruby-auto z z_autoenv visual-studio-code gh
    else
        echo -e "$VE Para habilitar los$RO plugins de BASH$VE ejecuta este scripts desde$RO bash$CL"
    fi
}

###########################
##       EJECUCIÓN       ##
###########################
