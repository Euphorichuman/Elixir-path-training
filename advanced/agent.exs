# Agent

# Start agent (with empty state)
{:ok, pid} = Agent.start_link(fn -> %{} end)
IO.inspect(pid)

# Get agent
IO.puts(inspect(Agent.get(pid, fn state -> state end)))

# Update state of agent
IO.puts(inspect(Agent.update(pid, fn state -> Map.merge(state, %{world: "World!"}) end)))
# Get agent after update
IO.puts(inspect(Agent.get(pid, fn state -> state end)))

# Get and update
IO.puts(
  inspect(Agent.get_and_update(pid, fn state -> {state, Map.merge(state, %{hello: "Hello"})} end))
)
# Get agent after update
IO.puts(inspect(Agent.get(pid, fn state -> state end)))
# Get agent specific value after update
IO.puts(inspect(Agent.get(pid, fn state -> state.hello end)))
