# IO and the file system

# IO module
IO.puts("Hello world!")
name = IO.gets("Whats is your name? ")
IO.puts("Hello #{name}")

# File module
file =
  case File.read("file/path") do
    {:ok, body} -> body
    {:error, e} -> e
  end

IO.puts(inspect(file))
