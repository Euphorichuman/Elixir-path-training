defmodule MixTest.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    children = [
      {DynamicSupervisor, name: MixTest.BucketSupervisor, strategy: :one_for_one},
      {MixTest.Registry, name: MixTest.Registry},
      {Task.Supervisor, name: MixTest.RouterTasks}
    ]

    Supervisor.init(children, strategy: :one_for_all)
  end
end
