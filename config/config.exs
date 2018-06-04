# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :expenses_api,
  namespace: ExpensesMicroservice,
  ecto_repos: [ExpensesMicroservice.Repo]

# Configures the endpoint
config :expenses_api, ExpensesMicroserviceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AiYV6eNrBUslGuv/rgn8sSlwOpyBK9S1ZXLrwwp66LtmPZEU3qE6oJCMJ6ZDEs4R",
  render_errors: [view: ExpensesMicroserviceWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ExpensesMicroservice.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
