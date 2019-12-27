defmodule Stacker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    topologies = [
      example: [
        strategy: Cluster.Strategy.Kubernetes,
        config: [
          kubernetes_ip_lookup_mode: :pods,
          mode: :ip,
          kubernetes_selector: "cluster=stacker",
          kubernetes_namespace: "default",
          kubernetes_node_basename: "stacker"
        ]
      ]
    ]

    # List all child processes to be supervised
    children = [
      {Cluster.Supervisor, [topologies, [name: Stacker.ClusterSupervisor]]},
      # Start the Ecto repository
      Stacker.Repo,
      # Start the endpoint when the application starts
      StackerWeb.Endpoint
      # Starts a worker by calling: Stacker.Worker.start_link(arg)
      # {Stacker.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Stacker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    StackerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
