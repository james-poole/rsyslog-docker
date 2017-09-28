FROM alpine
RUN apk add --no-cache rsyslog
COPY files/ /
ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslog.conf"]
