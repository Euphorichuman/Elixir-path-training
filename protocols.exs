# Protocols
# Data types that support protocols:
# -> Atom
# -> BitString
# -> Float
# -> Function
# -> Integer
# -> List
# -> Map
# -> PID
# -> Port
# -> Reference
# -> Tupl

# Create a protocol that convert any data type in :atom
defprotocol AtomType do
  def to_atom(data)
end

defimpl AtomType, for: Atom do
  def to_atom(data), do: data
end

defimpl AtomType, for: BitString do
  defdelegate to_atom(data), to: String
end

defimpl AtomType, for: List do
  defdelegate to_atom(data), to: List
end

defimpl AtomType, for: Map do
  def to_atom(map), do: List.first(Map.keys(map))
end

# String to :atom
atom = AtomType.to_atom("Hello")
IO.puts(inspect(atom))
