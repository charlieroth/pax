defmodule Pax.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PaxWeb.Telemetry,
      Pax.Repo,
      {DNSCluster, query: Application.get_env(:pax, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Pax.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Pax.Finch},
      # Start a worker by calling: Pax.Worker.start_link(arg)
      # {Pax.Worker, arg},
      # Start to serve requests, typically the last entry
      PaxWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pax.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PaxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
