defmodule MIX_TEST.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    children = [
      {DynamicSupervisor, name: MIX_TEST.BucketSupervisor, strategy: :one_for_one},
      {MIX_TEST.Registry, name: MIX_TEST.Registry}
    ]

    Supervisor.init(children, strategy: :one_for_all)
  end
end
