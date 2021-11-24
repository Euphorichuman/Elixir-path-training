# Comprehensions

# Keyword Lists
k_list = for {_key, val} <- [one: 1, two: 2, three: 3], do: val
IO.puts(inspect(k_list))

# Maps
map = for {k, v} <- %{"a" => "A", "b" => "B"}, do: {k, v}
IO.puts(inspect(map))

# Bitstrings
bin = for <<c <- "hello">>, do: <<c>>
IO.puts(inspect(bin))

# For pattern matching on their left-hand side
p_matching= for {:ok, val} <- [ok: "Hello", error: "Unknown", ok: "World!"], do: val
IO.puts(p_matching)

# Filters
import Integer
filter = for x <- 1..10, is_even(x), do: x
IO.puts(inspect(filter))
