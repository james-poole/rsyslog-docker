FROM alpine
RUN apk add --no-cache rsyslog && \
    sed -i -e 's/#$ModLoad imudp.so/$ModLoad imudp.so/g' /etc/rsyslog.conf && \
    sed -i -e 's/#$UDPServerRun/$UDPServerRun/g' /etc/rsyslog.conf
COPY files/ /
ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslog.conf"]
