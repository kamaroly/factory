defmodule Factory.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Factory.Repo,
      # Start the Telemetry supervisor
      FactoryWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Factory.PubSub},
      # Start the Endpoint (http/https)
      FactoryWeb.Endpoint
      # Start a worker by calling: Factory.Worker.start_link(arg)
      # {Factory.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Factory.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FactoryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
