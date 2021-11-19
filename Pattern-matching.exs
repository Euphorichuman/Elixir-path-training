# Destructuring data types
{a, _b, _c} = {:hello, "world", 42}
IO.puts(a)

# Match on specific values
{:ok, result} = {:ok, 13}
IO.puts(result)

# Adding items to a list
list = [1, 2, 3]
IO.puts(inspect([0 | list]))

# The pin operator: Matches without any assignment
a = 1
IO.puts ^a = 2 #MatchError
