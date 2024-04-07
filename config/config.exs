# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :fin_router,
  ecto_repos: [FinRouter.Repo]

# Configures the endpoint
config :fin_router, FinRouterWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: FinRouterWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: FinRouter.PubSub,
  live_view: [signing_salt: "Do77ElAn"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :fin_router, FinRouter.Node,
  host: "kujira-grpc.polkachu.com",
  port: 11890,
  websocket: "wss://rpc-kujira.starsquid.io"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
