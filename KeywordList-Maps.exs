# Keyword Lists
kList = [{:a, "Hello"}, {:b, "world"}]
IO.puts(inspect(kList))

kList2 = kList ++ [c: "!"]
IO.puts(inspect(kList2))

# Maps
map = %{:a => "Hello", "World" => :b}
x = 1
map2 = %{x => :atom}
IO.puts(map2[x])

IO.puts(Map.get(map, :a))
map3 = Map.put(map, :c, "!")
IO.puts(inspect(map3))
map4 = %{map3 | :c => " "}
IO.puts(inspect(map4.c))

# Nested data structures
users = [
  john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
]
IO.puts users[:mary].languages
