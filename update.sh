#!/bin/bash

set -eo pipefail

declare -a versions=(
  3.5
  3.4
  3.3
)

for version in "${versions[@]}"
do
  rm -rf "$version"
  cp -R base "$version"

  cat > "$version/Dockerfile" <<-END
# Generated automatically by update.sh
# Do no edit this file

FROM alpine:$version

RUN apk add --no-cache bash tzdata

COPY cron-entrypoint /usr/local/bin/

CMD ["cron-entrypoint"]
END

done
