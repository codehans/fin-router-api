defmodule FinRouter.Node do
  use Supervisor
  require Logger

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    config = Application.get_env(:fin_router, __MODULE__)

    children = [
      {__MODULE__.Grpc, config},
      {__MODULE__.Websocket, config}
    ]

    Supervisor.init(children, strategy: :one_for_one, name: __MODULE__.Supervisor)
  end

  def channel() do
    __MODULE__.Grpc.channel()
  end

  def subscribe(topic) do
    Phoenix.PubSub.subscribe(FinRouter.PubSub, topic)
  end
end
