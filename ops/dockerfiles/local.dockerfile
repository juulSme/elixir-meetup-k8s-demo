#############
# DEV IMAGE #
#############
FROM elixir:1.8-alpine AS base-image
LABEL maintainer "YipYip <devops@yipyip.nl>"

# [inotify-tools] required for Phoenix live-reloading
# [make, g++] needed for prometheus_process_collector
RUN apk add --no-cache --update inotify-tools make g++
