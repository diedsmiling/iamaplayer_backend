#!/usr/bin/env bash

docker stop iamaplayer
docker rm iamaplayer
docker rmi diedsmiling/iamaplayer
docker build -t diedsmiling/iamaplayer .
docker run -d -p 49170:3000 --name iamaplayer -v $HOME/projects/iamaplayer_backend/:/usr/src/app diedsmiling/iamaplayer tail -f /dev/null
docker exec -it iamaplayer /bin/bash
