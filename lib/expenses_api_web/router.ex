defmodule ExpensesMicroserviceWeb.Router do
  use ExpensesMicroserviceWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  scope "/api", ExpensesMicroserviceWeb do
    pipe_through :api
    resources("/expenses", ExpenseController, except: [:new, :edit])
  end
end
