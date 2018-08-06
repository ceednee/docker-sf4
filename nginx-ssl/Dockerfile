FROM alpine:3.7

RUN apk update && \
  apk add --no-cache certbot lynx && \
  rm -rf /var/cache/apk/*

VOLUME /etc/letsencrypt
VOLUME /var/lib/letsencrypt

COPY etc/crontab /var/spool/cron/crontabs/certbot-renew

EXPOSE 80 443

## Example: Register a new certificate
ENTRYPOINT /usr/bin/certbot certonly --verbose --noninteractive --standalone --agree-tos --email="ceednee@gmail.com" -d "www.kmts.fr,www.cafe-renaud.fr"

## Example: Register a new certificate (full command)
#ENTRYPOINT []
#CMD /usr/bin/certbot certonly --standalone -d kmts.test caferenaud.test logencia.test

## Example: Renew certificates now
CMD /usr/bin/certbot renew --no-self-upgrade

## Default: Run this container with auto-renew twice daily
CMD /usr/sbin/crond -fd15