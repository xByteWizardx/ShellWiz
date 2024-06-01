#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[9;33m'
BLUE='\033[0;34m'
MAGENT='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Otros colores
GREEN_S='\033[0;92m'
MAGENT_S='\033[0;95m'
RED_S='\033[1;91m'
CYAN_S='\033[3;96m'
YELLOW_S='\e[1;33m'

# Movimiento flechas
MOVE_UP=$(tput cuu1)
MOVE_DOWN=$(tput cud1)
MOVE_RIGHT=$(tput cuf1)
MOVE_LEFT=$(tput cub1)

# Historial de comandos
history_file="$HOME/.bash_history"

# Función para manejar las teclas de flecha
handle_arrow_keys() {
    read -rsn1 key
    case "$key" in
        '[A') echo -ne "$MOVE_UP";;     # Flecha arriba
        '[B') echo -ne "$MOVE_DOWN";;   # Flecha abajo
        '[C') echo -ne "$MOVE_RIGHT";;  # Flecha derecha
        '[D') echo -ne "$MOVE_LEFT";;   # Flecha izquierda
        *)    echo -ne "$key";;          # Cualquier otra tecla
    esac
}

# Limpiar la terminal
clear

# Inicializar el historial de comandos
touch "$history_file"

while true; do
    echo
    echo -ne "${GREEN_S}┌──${NC}${MAGENT_S}(${NC}${RED}$(whoami)${NC}@${CYAN}$(hostname)${NC}${MAGENT_S})${NC}${GREEN_S}-${NC}${CYAN}[${NC}${YELLOW}$(pwd)${NC}${CYAN}]${NC}\n${GREEN_S}"
    # Leer la entrada del usuario
    read -e -i "" -p "$(echo -e ${GREEN_S})└─$(echo -e ${NC})#$(echo -e ${CYAN_S}) " input
    # Guardar el comando en el historial
    echo "$input" >> "$history_file"
    echo -ne "${YELLOW_S}"; $input
done
