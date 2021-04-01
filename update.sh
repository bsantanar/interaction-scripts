#!bin/bash/
#Bash Script para actualizar un proyecto

PS3='¿Que tipo de proyecto actualizaras?: '
options=("Frontend" "Servidor" "Salir")
select opt in "${options[@]}"
do
        case $opt in
                "Frontend")
                    echo "Nombre de la carpeta: "
                    read a
                    cd $a
                    echo "Actualizando repositorio..."
                    git pull origin master
                    npm run build
                    echo "Levantando proceso en PM2..."
                    pm2 restart ecosystem.config.js --update-env
                    echo "Actualizacion finalizada!"
                    break
                    ;;
                "Servidor")
                    echo "Nombre de la carpeta: "
                    read a
                    cd $a
                    echo "Actualizando repositorio..."
                    git pull origin master
                    echo "Levantando proceso en PM2..."
                    pm2 restart ecosystem.config.js --update-env
                    echo "Actualizacion finalizada!"
                    break
                    ;;
                "Salir")
                    break
                    ;;
                *) echo "invalid option $REPLY";;
        esac
done
