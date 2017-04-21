# Generated automatically by update.sh
# Do no edit this file

FROM alpine:3.3

RUN echo $"http://mirrors.ustc.edu.cn/alpine/v3.3/main/\n\
  http://mirrors.ustc.edu.cn/alpine/v3.3/community\n"\
  > /etc/apk/repositories

RUN apk add --no-cache bash tzdata

COPY cron-entrypoint /usr/local/bin/

CMD ["cron-entrypoint"]
