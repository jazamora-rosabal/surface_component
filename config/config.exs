# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :surface_component, SurfaceComponentWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zproLBse5v0wDxDHYKCZ1IKjVNi0U5b4RkrTyzC3IGqssMtDls4L9/sOyZUFO957",
  render_errors: [view: SurfaceComponentWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SurfaceComponent.PubSub,
  live_view: [signing_salt: "STLlboi1"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
