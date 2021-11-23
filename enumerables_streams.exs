# Enumerables
map = %{"a" => 1, "b" => 2}
# Multiply each number on the map by 2
IO.puts(inspect(Enum.map(map, fn {k, v} -> {k, v * 2} end)))

odd? = &(rem(&1, 2) == 1)
# Check if all of the elements in the list are odd numbers
res = Enum.all?([3, 3, 3, 5], odd?)
IO.puts(res)

# Streams
# Get 10 random numbers (Use de Pipe operator)
IO.puts(inspect(Stream.repeatedly(&:rand.uniform/0) |> Enum.take(10)))
