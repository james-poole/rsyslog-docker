FROM alpine
RUN apk add --no-cache rsyslog
COPY files/ /
EXPOSE 8514/udp 10514
ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslog.conf"]
