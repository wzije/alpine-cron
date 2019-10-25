FROM alpine:3.9
LABEL maintainer="Jehan<jee.archer@gmail.com>"

RUN apk --no-cache add php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl \
    php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype \
    php7-mcrypt php7-dom php7-simplexml php7-fileinfo php7-tokenizer php7-xmlwriter php7-session \
    php7-mbstring php7-gd php7-pdo_mysql

RUN apk add --update busybox-suid
COPY ./cron.d/crontab /tmp/cron.d/crontab
RUN chmod 0600 /tmp/cron.d/crontab
RUN crontab /tmp/cron.d/crontab
RUN touch /tmp/cron.log

CMD ["crond", "-f", "-d", "8"]
