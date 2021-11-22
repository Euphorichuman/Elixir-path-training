# Keyword Lists
k_list = [{:a, "Hello"}, {:b, "world"}]
IO.puts(inspect(k_list))

k_list_2 = k_list ++ [c: "!"]
IO.puts(inspect(k_list_2))

# Maps
map = %{:a => "Hello", "World" => :b}
x = 1
map_2 = %{x => :atom}
IO.puts(map_2[x])

IO.puts(Map.get(map, :a))
map_3 = Map.put(map, :c, "!")
IO.puts(inspect(map_3))
map_4 = %{map_3 | :c => " "}
IO.puts(inspect(map_4.c))

# Nested data structures
users = [
  john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
]
IO.puts users[:mary].languages
