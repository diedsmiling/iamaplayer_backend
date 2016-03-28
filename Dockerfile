FROM node:argon
MAINTAINER Lazarev Alexandr <lazarev@elje-group.com>

EXPOSE 8080

RUN mkdir /docker-entrypoint
COPY ./docker_entry.sh /docker-entrypoint
RUN ls -l
RUN ls -l /docker-entrypoint
RUN chmod 755 -R /docker-entrypoint/

ENTRYPOINT ["/docker-entrypoint/docker_entry.sh"]