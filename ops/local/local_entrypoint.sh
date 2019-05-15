#!/bin/sh

# Install dependencies and compile
mix local.hex --force
mix local.rebar --force
mix deps.get
mix clean
mix compile

# Spin up the server
elixir -S mix phx.server