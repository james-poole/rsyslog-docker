FROM alpine
COPY files/ /
RUN apk add --no-cache rsyslog logrotate supervisor && \
    chmod 0444 /etc/logrotate.d/haproxy.conf
EXPOSE 8514/udp 10514
ENTRYPOINT ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
