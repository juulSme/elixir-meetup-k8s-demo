defmodule DemoWeb.Router do
  use DemoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DemoWeb do
    pipe_through :api

    scope "/greetings" do
      get "/", DummyController, :hello
      get "/:subject", DummyController, :hello
    end
  end
end
