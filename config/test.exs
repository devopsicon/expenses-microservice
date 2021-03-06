use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :expenses_api, ExpensesMicroserviceWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :expenses_api, ExpensesMicroservice.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "expenses_api_test",
  hostname: "192.168.0.10",
  pool: Ecto.Adapters.SQL.Sandbox
