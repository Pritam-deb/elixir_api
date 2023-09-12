defmodule ElixirApiWeb.DefaultController do
  use ElixirApiWeb, :controller
  def index(conn, _params) do
    text conn, "ELIXIR is LIVE---- #{Mix.env()}"
  end
end
