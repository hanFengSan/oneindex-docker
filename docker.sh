#!/bin/bash
docker container stop alex-oneindex
docker container rm alex-oneindex
docker image rm alex-oneindex
docker build -t alex-oneindex .
docker run -d --name alex-oneindex \
    -p 8081:80 --restart=always \
    -v ~/cloud_drive/config:/var/www/html/config \
    -v ~/cloud_drive/cache:/var/www/html/cache \
    -e REFRESH_TOKEN='0 * * * *' \
    -e REFRESH_CACHE='*/10 * * * *' \
    alex-oneindex

