# The [`bigtruedata/cron`](https://hub.docker.com/r/bigtruedata/cron/) Docker image

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


## Overview

This image provides a simple way of executing task. Therefore it can be used for administration tasks such as automated backups, periodic command execution in a web front-end, and so.

Major features of this image include
- cron syntax to execute commands, and
- local date & time adjustments.

The image is intended to be used along other containers as a sidecar that perform scheduled tasks related to the container is attached to.

This image is based in the [Alpine Linux Docker image](https://hub.docker.com/r/library/alpine/) to avoid generating a image bigger than necessary.
