FROM node:argon
MAINTAINER Lazarev Alexandr <lazarev@elje-group.com>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN mkdir /docker-entrypoint
COPY ./docker_entry.sh /docker-entrypoint

RUN chmod 755 -R /docker-entrypoint/
RUN npm install -g nodemon
ENTRYPOINT ["/docker-entrypoint/docker_entry.sh"]