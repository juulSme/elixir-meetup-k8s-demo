################
# DEPLOY IMAGE #
################
FROM elixir:1.8-alpine AS base-image
LABEL maintainer "YipYip <devops@yipyip.nl>"

ADD . /application
WORKDIR /application
ENV MIX_ENV=k8s

# Install dependencies and compile
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get && \
    mix compile && \
    mix clean

CMD elixir -S mix phx.server