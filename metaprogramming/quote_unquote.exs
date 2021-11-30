# Quote
IO.inspect(quote do: 42)
IO.inspect(quote do: "Hello")
IO.inspect(quote do: sum(1, 2 + 3, 4))

# Unquote
denominator = 2
IO.inspect(quote do: divide(42, denominator))
IO.inspect(quote do: divide(42, unquote(denominator)))
