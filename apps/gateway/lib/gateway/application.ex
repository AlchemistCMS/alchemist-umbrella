defmodule Gateway.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Gateway.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Gateway.PubSub}
      # Start a worker by calling: Gateway.Worker.start_link(arg)
      # {Gateway.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Gateway.Supervisor)
  end
end
