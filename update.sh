#!/bin/bash

set -eo pipefail

declare -a versions=(
  edge
  3.5
  3.4
  3.3
)

for version in "${versions[@]}"
do
  rm -rf "$version"
  cp -R base "$version"

  if [ "$version" = "edge" ];
  then
    tag=$version
  else
    tag="v$version"
  fi

  cat > "$version/Dockerfile" <<-END
# Generated automatically by update.sh
# Do no edit this file

FROM alpine:$version

RUN echo $'http://mirrors.ustc.edu.cn/alpine/$tag/main/\n\\
http://mirrors.ustc.edu.cn/alpine/$tag/community\n'\\
  > /etc/apk/repositories

RUN apk add --no-cache bash tzdata

COPY cron-entrypoint /usr/local/bin/

CMD ["cron-entrypoint"]
END

done
