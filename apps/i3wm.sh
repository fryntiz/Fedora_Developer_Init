i3wm_dependencias() {
    echo "Instalando Dependencias"
    dependencias="i3 i3status dmenu i3lock xbacklight feh alsamixer nmcli mc links"

    for x in $dependencias
    do
        echo "Instalando $x"
        sudo dnf install -y $x
    done
}

i3wm_instalación() {
    i3wm_dependencias
}
