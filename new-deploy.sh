#!bin/bash/
#Bash Script para crear nuevo proyecto

PS3='Escoge una opcion: '
options=("Interaction-project" "Interaction-dashboard" "Interaction-spa" "Interaction-dataset" "Interaction-server")
select opt in "${options[@]}"
do
        case $opt in
                "Interaction-project")
                    echo "Nombre de la carpeta: "
                    read a
                    echo "Nombre del proceso en pm2: "
                    read b
                    echo "Puerto: "
                    read c
                    echo "Ingresa ID del proyecto: "
                    read d
                    echo "Clonando repositorio..."
                    git clone https://github.com/bsantanar/interaction-project.git $a
                    cd $a
                    npm i
                    sed -i "s/localhost/165.227.49.255/" vue.config.js
                    sed -i "s/project/$b/" ecosystem.config.js
                    sed -i "s/8082/$c/" ecosystem.config.js
                    sed -i "s/ID_PROJECT/$d/" vue.config.js
                    npm run build
                    echo "Levantando proceso en PM2..."
                    pm2 start ecosystem.config.js
                    echo "FINALIZADO!"
                    break
                    ;;
                "Interaction-dashboard")
                    echo "Nombre de la carpeta: "
                    read a
                    echo "Nombre del proceso en pm2: "
                    read b
                    echo "Puerto: "
                    read c
                    echo "Clonando repositorio..."
                    git clone https://github.com/bsantanar/interaction-dashboard.git $a
                    cd $a
                    npm i
                    sed -i "s/localhost/165.227.49.255/" vue.config.js
                    sed -i "s/dashboard/$b/" ecosystem.config.js
                    sed -i "s/9090/$c/" ecosystem.config.js
                    npm run build
                    echo "Levantando proceso en PM2..."
                    pm2 start ecosystem.config.js
                    echo "FINALIZADO!"
                    break
                    ;;
                "Interaction-spa")
                    echo "Nombre de la carpeta: "
                    read a
                    echo "Nombre del proceso en pm2: "
                    read b
                    echo "Puerto: "
                    read c
                    echo "Clonando repositorio..."
                    git clone https://github.com/bsantanar/interaction-spa.git $a
                    cd $a
                    npm i
                    sed -i "s/localhost/165.227.49.255/" vue.config.js
                    sed -i "s/spa/$b/" ecosystem.config.js
                    sed -i "s/8080/$c/" ecosystem.config.js
                    npm run build
                    echo "Levantando proceso en PM2..."
                    pm2 start ecosystem.config.js
                    echo "FINALIZADO!"
                    break
                    ;;
                "Interaction-dataset")
                    echo "Nombre de la carpeta: "
                    read a
                    echo "Nombre del proceso en pm2: "
                    read b
                    echo "Puerto: "
                    read c
                    echo "Clonando repositorio..."
                    git clone https://github.com/bsantanar/interaction-dataset.git $a
                    cd $a
                    npm i
                    sed -i "s/localhost/165.227.49.255/" vue.config.js
                    sed -i "s/dataset/$b/" ecosystem.config.js
                    sed -i "s/8081/$c/" ecosystem.config.js
                    npm run build
                    echo "Levantando proceso en PM2..."
                    pm2 start ecosystem.config.js
                    echo "FINALIZADO!"
                    break
                    ;;
                "Interaction-server")
                    echo "Nombre de la carpeta: "
                    read a
                    echo "Clonando repositorio..."
                    git clone https://github.com/bsantanar/interaction-server.git $a
                    cd $a
                    npm i
                    echo "Levantando proceso en PM2..."
                    pm2 start ecosystem.config.js
                    echo "FINALIZADO!"
                    break
                    ;;
                *) echo "invalid option $REPLY";;
        esac
done
