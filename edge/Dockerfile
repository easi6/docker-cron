# Generated automatically by update.sh
# Do no edit this file

FROM alpine:edge

RUN echo $'http://mirrors.ustc.edu.cn/alpine/edge/main/\n\
  http://mirrors.ustc.edu.cn/alpine/edge/community\n'\
  > /etc/apk/repositories

RUN apk add --no-cache bash tzdata

COPY cron-entrypoint /usr/local/bin/

CMD ["cron-entrypoint"]
