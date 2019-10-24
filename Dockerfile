FROM alpine:3.9
LABEL maintainer="Jehan<jee.archer@gmail.com>"

RUN apk --no-cache add php7 php7-json

RUN apk add --update busybox-suid
COPY ./cron.d/crontab /tmp/cron.d/crontab
RUN chmod 0600 /tmp/cron.d/crontab
RUN crontab /tmp/cron.d/crontab
RUN touch /tmp/cron.log

CMD ["crond", "-f", "-d", "8"]
