# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :stacker,
  ecto_repos: [Stacker.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :stacker, StackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IGCCl1gO7TpSNrEYoaNiiBSccTzyUGipVRg1WmUlHhLHbEke9kKRIK0gq2NbD7VL",
  render_errors: [view: StackerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Stacker.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :fun_with_flags, :persistence,
  adapter: FunWithFlags.Store.Persistent.Ecto,
  repo: Stacker.Repo

config :fun_with_flags, :cache_bust_notifications, enabled: false
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
