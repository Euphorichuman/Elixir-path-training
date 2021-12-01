# Try, catch, and rescue

# Raise an error
# raise "Oh no, an error has ocurred"

# Define erros
defmodule Error do
  defexception message: "an error has occurred"
end

# Error rescued, and after
try do
  raise Error
rescue
  e in Error -> IO.puts("An error occurred: " <> e.message)
after
  # Do somerthing after error ocurred
  IO.puts("After error")
end

# Throw
try do
  for x <- 0..10 do
    if x == 3, do: throw(x)
    IO.puts(x)
  end
catch
  x -> IO.puts("Caught: #{x}")
end

# Exit
try do
  exit("exit")
catch
  :exit, _ -> IO.puts("exit blocked")
end
