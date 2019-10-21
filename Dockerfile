FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
	postgis
RUN pg_dropcluster 11 main

COPY endpoint.sh /sbin/endpoint.sh
RUN chmod 755 /sbin/endpoint.sh

EXPOSE 5432/tcp
VOLUME ["/var/lib/postgresql", "/etc/postgresql"]

ENTRYPOINT ["/sbin/endpoint.sh"]
CMD ["app:start"]