FROM alpine
COPY files/ /
RUN apk add --no-cache rsyslog logrotate supervisor && \
    chmod 0444 /etc/logrotate.d/haproxy.conf && \
    apk add --no-cache --virtual=goss-dependencies curl ca-certificates && \
    curl -fsSL https://goss.rocks/install | sh && \
    apk del goss-dependencies
EXPOSE 8514/udp 10514 8080
ENTRYPOINT ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
