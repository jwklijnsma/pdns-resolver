FROM ubuntu:24.04
LABEL maintainer="janwiebe@janwiebe.eu"


RUN apt-get update && apt-get upgrade -y && apt-get clean 
RUN apt-get install pdns-recursor -y
RUN mkdir -p /var/run/pdns-recursor
COPY recursor.conf /etc/powerdns/

EXPOSE 5253/tcp
EXPOSE 5253/udp

ENTRYPOINT /usr/sbin/pdns_recursor --config-dir=/etc/powerdns
