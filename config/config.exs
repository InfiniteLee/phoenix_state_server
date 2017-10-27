# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :state_server,
  ecto_repos: [StateServer.Repo]

# Configures the endpoint
config :state_server, StateServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ki5+5V4/oGocFJZ+0tyoXa9hzJcHORwnEkhVP7N/BcHjQe9DNXkBSWQMeNmxIe2l",
  render_errors: [view: StateServerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: StateServer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
