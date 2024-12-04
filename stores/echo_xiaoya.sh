#!/bin/sh

download_dockercompose() {
    sudo curl -L "https://mirror.ghproxy.com/https://github.com/docker/compose/releases/download/v2.27.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}

download_xiaoya_shell() {
    export GH_PROXY=https://gh.monlor.com/ IMAGE_PROXY=ghcr.monlor.com
    sudo bash -c "$(curl -fsSL ${GH_PROXY}https://raw.githubusercontent.com/monlor/docker-xiaoya/main/install.sh)"
}

download_xiaoya_user() {
    sudo curl -#LO https://gh.monlor.com/https://raw.githubusercontent.com/monlor/docker-xiaoya/main/docker-compose.yml
    sudo curl -#LO https://gh.monlor.com/https://raw.githubusercontent.com/monlor/docker-xiaoya/main/env

    # sudo docker compose up -d && docker compose logs
}

download_xiaoya_zhoubian() {
    sudo bash -c "$(curl --insecure -fsSL https://ddsrem.com/xiaoya_install.sh)"
    
    sudo bash -c "$(curl --insecure -fsSL https://gh.monlor.com/https://raw.githubusercontent.com/DDS-Derek/xiaoya-alist/master/main.sh)"
}



case "$1" in
   'ddc')
        download_dockercompose
    ;;
   'xs')
        download_xiaoya_shell
    ;;
    'xu')
        download_xiaoya_user
    ;;
    'docker_build')
        docker_build
    ;;
    'docker_run')
        docker_run
    ;;
  *)
     echo "Usage: run.sh {ddc | xs | xu | docker_build | docker_run | dev_run | freeze}"
     exit 1
esac