# Processes

# Spawn
pid = spawn(fn -> IO.puts("Hello world!") end)
IO.puts(inspect(pid))

# Sending and Receiving Messages
send(self(), {:ok, "Everything works well"})

res =
  receive do
    {:ok, msg} -> msg
    _ -> "Something went wrong"
  end

IO.puts(res)
