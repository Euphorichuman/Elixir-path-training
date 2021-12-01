# Erlang libraries

# The binary module
IO.puts(inspect(String.to_charlist("Ø")))

# Formatted text output
IO.puts(:io.format("Pi is approximately given by:~10.3f~n", [:math.pi()]))

# The crypto module
IO.puts(Base.encode16(:crypto.hash(:sha256, "Hello world!")))

# The digraph module
digraph = :digraph.new()
coords = [{0.0, 0.0}, {1.0, 0.0}, {1.0, 1.0}]
[v0, v1, v2] = for c <- coords, do: :digraph.add_vertex(digraph, c)
:digraph.add_edge(digraph, v0, v1)
:digraph.add_edge(digraph, v1, v2)
IO.puts(inspect(:digraph.get_short_path(digraph, v0, v2)))

# Erlang Term Storage
table = :ets.new(:ets_test, [])
# Store as tuples with {name, population}
:ets.insert(table, {"China", 1_374_000_000})
:ets.insert(table, {"India", 1_284_000_000})
:ets.insert(table, {"USA", 322_000_000})
# IO.puts(inspect(:ets.i(table)))

# The math module
angle_45_deg = :math.pi() * 45.0 / 180.0
IO.puts(:math.sin(angle_45_deg))

# The queue module
q = :queue.new()
q = :queue.in("A", q)
q = :queue.in("B", q)
{value, q} = :queue.out(q)
IO.puts(inspect(value))

# The rand module
IO.puts(:rand.uniform())

# The zip and zlib modules
str =
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce molestie efficitur dolor, tempor rutrum arcu semper ut. Morbi eget finibus ipsum, euismod blandit justo. Aliquam erat volutpat. Maecenas mauris elit, bibendum ac neque vel, dapibus placerat justo. Phasellus scelerisque magna laoreet, fringilla nibh nec, volutpat tortor. Curabitur cursus consequat ante, sed gravida massa lobortis in. Sed molestie egestas diam, ac tristique est congue sit amet. Sed at placerat purus. Quisque vestibulum dui consectetur turpis gravida venenatis eget id risus. Integer fringilla felis sed ante hendrerit, vitae posuere ex pellentesque. Suspendisse tincidunt mauris in neque mollis faucibus vel a nunc. Nulla consequat augue urna, ut dignissim orci dictum sit amet."

str_compressed = :zlib.compress(str)
IO.puts(byte_size(str))
IO.puts(byte_size(str_compressed))
