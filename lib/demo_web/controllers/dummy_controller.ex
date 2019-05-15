defmodule DemoWeb.DummyController do
  use DemoWeb, :controller

  @spec hello(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def hello(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("greeting.json", subject: conn.path_params["subject"] || "world")
  end
end
