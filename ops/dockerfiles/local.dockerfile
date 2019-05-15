#############
# DEV IMAGE #
#############
FROM elixir:1.8-alpine AS base-image
LABEL maintainer "YipYip <devops@yipyip.nl>"

# [inotify-tools] required for Phoenix live-reloading
RUN apk add --no-cache --update inotify-tools