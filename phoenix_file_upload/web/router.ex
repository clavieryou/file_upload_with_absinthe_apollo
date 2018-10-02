defmodule PhoenixFileUpload.Router do
  use PhoenixFileUpload.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixFileUpload do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/graphql" do
    forward("/", Absinthe.Plug, schema: PhoenixFileUpload.Schema)
  end

  scope "/graphiql" do
    forward(
      "/",
      Absinthe.Plug.GraphiQL,
      schema: PhoenixFileUpload.Schema
    )
  end
  # Other scopes may use custom stacks.
  # scope "/api", PhoenixFileUpload do
  #   pipe_through :api
  # end
end
