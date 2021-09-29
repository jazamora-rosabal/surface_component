defmodule SurfaceComponent.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SurfaceComponentWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SurfaceComponent.PubSub},
      # Start the Endpoint (http/https)
      SurfaceComponentWeb.Endpoint
      # Start a worker by calling: SurfaceComponent.Worker.start_link(arg)
      # {SurfaceComponent.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SurfaceComponent.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SurfaceComponentWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
