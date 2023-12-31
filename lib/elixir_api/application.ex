defmodule ElixirApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ElixirApiWeb.Telemetry,
      # Start the Ecto repository
      ElixirApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirApi.PubSub},
      # Start the Endpoint (http/https)
      ElixirApiWeb.Endpoint
      # Start a worker by calling: ElixirApi.Worker.start_link(arg)
      # {ElixirApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
