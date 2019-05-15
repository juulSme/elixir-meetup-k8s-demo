#!/bin/sh

# Install dependencies and compile
mix local.hex --force
mix local.rebar --force
mix deps.get
mix clean
mix compile

# Spin up the server
elixir \
  --erl "-kernel inet_dist_listen_min 5000" \
  --erl "-kernel inet_dist_listen_max 5000" \
  --name demo@$HOSTNAME \
  --cookie $ERLANG_COOKIE \
  -S mix phx.server