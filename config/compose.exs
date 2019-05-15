use Mix.Config

import_config "dev.exs"

config :peerage,
  interval: 60,
  via: Peerage.Via.List,
  node_list: [
    :"demo@demo-backend-one.",
    :"demo@demo-backend-two."
  ]
