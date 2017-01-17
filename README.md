# The [`bigtruedata/cron`](https://hub.docker.com/r/bigtruedata/cron/) Docker image

[![Docker Pulls](https://img.shields.io/docker/pulls/bigtruedata/cron.svg)](https://hub.docker.com/r/bigtruedata/cron/)
[![Docker Stars](https://img.shields.io/docker/stars/bigtruedata/cron.svg)](https://hub.docker.com/r/bigtruedata/cron/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Table of Contents
- [Overview](#overview)
- [Quick Start](#quick-start)


## Overview

This image provides a simple way of executing task. Therefore it can be used for administration tasks such as automated backups, periodic command execution in a web front-end, and so.

Major features of this image include
- cron syntax to execute commands, and
- local date & time adjustments.

The image is intended to be used along other containers as a sidecar that perform scheduled tasks related to the container is attached to.

This image is based in the [Alpine Linux Docker image](https://hub.docker.com/r/library/alpine/) to avoid generating a image bigger than necessary.


## Quick Start

This image is provided to be executed with a little configuration using environment variables. These variables can be divided into two groups:
- `TIME_ZONE` and `TIME_SERVER` to configure and adjust the local time of the container, and
- `CRON_ENTRY` to scheduling the task the container is ought to execute.

### Executing a cron task

The image is currently designed to support the execution of a sigle cron task. The specification of the date and time, and the task to be run is specified using the `CRON_ENTRY` environment variable. More information on how this format is specified can be found on the `crontab(5)` manual page on Unix systems.

The following command executes the image and schedules every minute a tasks that prints the current date and time of the running container:
```sh
docker run --rm --tty --interactive --env "CRON_ENTRY=* * * * * date" bigtruedata/cron
```

### Configuring the local time of the running container

The local time of the container can be localized using the `TIME_ZONE` environment variable. If not provided, the configured timezone of the container defaults to Alpine's image configuration (Currently UTC).

The following command uses Iran's time zone to configure the container's location:
```sh
docker run --rm --tty --interactive --env "TIME_ZONE=Iran" bigtruedata/cron
```

### Adjusting the container's internal clock

When the image is run the `entrypoint` script synchronizes the local time using a time server. By default, the time server used is `pool.ntp.org` but it can be overriden using the `TIME_SERVER` environment variable.

The following command uses the `hora.rediris.es` time server for time synchornization:
```sh
docker run --rm --tty --interactive --env "TIME_SERVER=hora.rediris.es" bigtruedata/cron
```
