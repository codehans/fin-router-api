defmodule FinRouter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      FinRouter.Repo,
      # Start the Telemetry supervisor
      FinRouterWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: FinRouter.PubSub},
      # Start the Endpoint (http/https)
      FinRouterWeb.Endpoint,
      # Start a worker by calling: FinRouter.Worker.start_link(arg)
      # {FinRouter.Worker, arg}
      FinRouter.Node
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FinRouter.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FinRouterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
