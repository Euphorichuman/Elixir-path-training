# String concatenation
str = "fizz"
str2 = "buzz"
_str3 = str <> str2
IO.puts(str <> str2)

# or
IO.puts(1 || true)

# and
IO.puts(nil && 13) # nil is like as a "falsy" in boolean context

# not
IO.puts(!true)
