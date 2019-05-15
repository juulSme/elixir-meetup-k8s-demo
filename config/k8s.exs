use Mix.Config

import_config "dev.exs"

config :peerage,
  via: Peerage.Via.Dns,
  dns_name: System.get_env("NODE_DISCOVERY_DNS_NAME"),
  app_name: "demo",
  interval: 60
