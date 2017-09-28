FROM alpine
RUN apk add --no-cache rsyslog && \
    sed -i -e '1,/#$ModLoad imtcp/ s/#$ModLoad imtcp/$ModLoad imtcp.so/' /etc/rsyslog.conf && \
    sed -i -e '1,/#$TCPServerRun 10514/ s/#$TCPServerRun 10514/$TCPServerRun 10514/' /etc/rsyslog.conf && \
    sed -i -e 's/#$ModLoad imudp.so/$ModLoad imudp.so/g' /etc/rsyslog.conf && \
    sed -i -e 's/#$UDPServerRun 514/$UDPServerRun 8514/g' /etc/rsyslog.conf
COPY files/ /
EXPOSE 8514/udp 10514
ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslog.conf"]
