FROM alpine
RUN apk add --no-cache rsyslog logrotate
COPY files/ /
EXPOSE 8514/udp 10514
ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslog.conf"]
