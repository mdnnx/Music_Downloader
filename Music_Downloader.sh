#!/bin/bash
#script by Armin Van Mont
ColorVerde="\e[0;32m\033[1m"
FinColor="\033[0m\e[0m"
ColorRojo="\e[0;31m\033[1m"
ColorAzul="\e[0;34m\033[1m"
ColorAmarillo="\e[0;33m\033[1m"
ColorMorado="\e[0;35m\033[1m"
ColorTurquesa="\e[0;36m\033[1m"
ColorGris="\e[0;32m\033[1m"
clear
requisito="python3"
segundorequisito="ffmpeg"
tercerrequisito="yt-dlp"

function verificar {
	if command -v $requisito &> /dev/null; then
		echo "$requisito instalado"
		return 
	else
		echo "$requisito no existe y se instalara de inmediato"
		instalar
	fi
}

function instalar { 
	echo " Instalando $requisito ...."
	pkg install -y $requisito
	if [ $? -eq 0 ]; then
		echo "$requisito se ha instalado con exito"
	else
		echo "Hubo un problema al trata de instalar $requisito"
	fi
}

function segunda_verificacion {
	if command -v $segundorequisito &> /dev/null; then
		echo "$segundorequisito instalado"
		return
	else
		echo "$segundorequisito no existe y se instalara de inmediato"
		instalar_segundorequisito
	fi
}
function instalar_segundorequisito {
	echo "Instalando $segundorequisito ...."
	pkg install -y $segundorequisito
	if [ $? -eq 0 ]; then
		echo "$segundorequisito se ha instalado con exito"
	else
		echo "Hubo un problema al tratar de instalar $segundorequisito"
	fi


}
function tercera_verificacion {
	if command -v $tercerrequisito &> /dev/null; then
		echo "$tercerrequisito instalado"
		return
	else
		echo "$tercerrequisito no existe y se instalara de inmediato"
		instalar_tercerrequisito
	fi
}
function instalar_tercerrequisito {
	echo "Instalando $tercerrequisito ...."
	python3 -m pip install --upgrade yt-dlp
	if [ $? -eq 0 ]; then
		echo "$tercerrequisito se ha instalado con exito"
	else
		echo "Hubo un problema al tratar de instalar $tercerrequisito"
	fi
}


function banner { 
echo -e "${ColorVerde}
##########################################################################################################

   ____    ____                          ______
   |   \  /    |                         |     \                                                          
   |	\/     |                         |  |\  \            
   |           |       ____     ____     |  | |  |  ___                     ___   ___   __    ___  ___
   |   |\_/|   | |   | |___  |  |        |  |/   | |   | |  |  | |\  | |   |   | |___| |  \  |__  |___|
   |   |   |   | |   |    |  |  |        |      /  |   | |  |  | | \ | |   |   | |   | |   | |    | \        |___|   |___| |___| ___|  |  |___     |_____/   |___| |__|__| |  \| |__ |___| |   | |__/  |___ |  \\


   BY ARMIN VAN MONT
   Youtube: https://youtube.com/@arminvanmont9677?si=xXxzH--ZrgfcN2SK
   


##########################################################################################################
${FinColor}"
}
verificar
segunda_verificacion
tercera_verificacion
banner


echo -e ${ColorRojo}"Descarga el audio de tres videos de youtube en formato .mp3. \nHaz tus elecciones pegando el link copiado desde el video de youtube elegido" ${FinColor}
read -p "Primera eleccion: " Primero
read -p "Como deseas nombrar a tu nuevo audio: " PrimerNombre
read -p "Segunda eleccion: " Segunda
read -p "Como deseas llamar a tu nuevo audio: " SegundoNombre
read -p "Tercera eleccion: " Tercera
read -p "Como deseas llamar a tu nuevo audio: " TercerNombre

clear
yt-dlp --extract-audio --audio-format mp3 $Primero -o $PrimerNombre.mp3
mv $PrimerNombre.mp3 /data/data/com.termux/files/home/storage/downloads
clear
yt-dlp --extract-audio --audio-format mp3 $Segunda -o $SegundoNombre.mp3
mv $SegundoNombre.mp3 /data/data/com.termux/files/home/storage/downloads
clear
yt-dlp --extract-audio --audio-format mp3 $Tercera -o $TercerNombre.mp3
mv $TercerNombre.mp3 /data/data/com.termux/files/home/storage/downloads

echo "Descargas completadas"

