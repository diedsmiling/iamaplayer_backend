#!/usr/bin/env bash
docker stop iamaplayer
docker rm iamaplayer
docker rmi diedsmiling/iamaplayer
docker build -t diedsmiling/iamaplayer .
docker-compose up
