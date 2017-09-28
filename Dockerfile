FROM alpine
RUN apk add --no-cache rsyslog && \
    sed -i -e '0,/#$ModLoad imtcp/ s/#$ModLoad imtcp/$ModLoad imtcp/' /etc/rsyslog.conf && \
    sed -i -e '0,/#$TCPServerRun 10514/ s/#$TCPServerRun 10514/$TCPServerRun 10514/' /etc/rsyslog.conf && \
    sed -i -e 's/#$ModLoad imudp.so/$ModLoad imudp.so/g' /etc/rsyslog.conf && \
    sed -i -e 's/#$UDPServerRun 514/$UDPServerRun 8514/g' /etc/rsyslog.conf
COPY files/ /
ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslog.conf"]
