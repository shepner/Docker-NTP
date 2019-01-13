FROM alpine:latest

LABEL \
  org.asyla.release-date="2019-01-13" \
  org.asyla.maintainer="shepner@asyla.org" \
  org.asyla.description="NTP server"

# install openntp
RUN \
  apk update \
  && apk add --no-cache openntpd

# use custom ntpd config file
RUN mkdir -p /etc
COPY ntpd.conf /etc/ntpd.conf

# ntp port
EXPOSE 123/udp

# let docker know how to test container health
HEALTHCHECK CMD ntpctl -s status || exit 1

# start ntpd in the foreground
ENTRYPOINT [ "/usr/sbin/ntpd", "-v", "-d", "-s" ]

