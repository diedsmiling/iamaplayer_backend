#!/usr/bin/env bash

docker stop iamaplayer
docker rm iamaplayer
docker rmi diedsmiling/iamaplayer
docker build -t diedsmiling/iamaplayer .
docker run -d -p 49170:3000 --name iamaplayer -v $HOME/projects/iamaplayer_graphql_server/:/usr/src/app diedsmiling/iamaplayer tail -f /dev/null
docker logs --follow iamaplayer
