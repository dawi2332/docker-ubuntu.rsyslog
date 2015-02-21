FROM dawi2332/etcdctl:v0.4.6

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y rsyslog rsyslog-gnutls

# copy rsyslog config files and papertrail.com TLS cert
COPY assets/etc/rsyslog.d/ /etc/rsyslog.d/
COPY assets/etc/papertrail-bundle.pem /etc/papertrail-bundle.pem

COPY init.d /docker-entrypoint-init.d
