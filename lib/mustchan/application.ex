defmodule Mustchan.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MustchanWeb.Telemetry,
      Mustchan.Repo,
      {DNSCluster, query: Application.get_env(:mustchan, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Mustchan.PubSub},
      # Start a worker by calling: Mustchan.Worker.start_link(arg)
      # {Mustchan.Worker, arg},
      # Start to serve requests, typically the last entry
      MustchanWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mustchan.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MustchanWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
