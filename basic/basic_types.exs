# Data types
# 1          # integer
# 0x1F       # integer
# 1.0        # float
# true       # boolean
# :atom      # atom / symbol
# "elixir"   # string
# [1, 2, 3]  # list
# {1, 2, 3}  # tuple

_intType = 1
floatType = 3.14159265359
_floatScientificType = 1.0e-10
_booleanType = true
_atomType = :atom
_stringType = "Hello world!"
_listType = {1, 2, 3}
_tupleType = [1, 2, 3]

IO.puts(trunc(floatType))

# String
str = :world

# Anonymous functions
print = fn str -> IO.puts("Hello #{str}") end
print.(str)


# Lists
list = [1, 2, true, 3]

IO.puts(length(list))

listConcatenated = fn (x, y) -> x ++ y end
IO.puts(inspect(listConcatenated.([1, 2, 3], [4, 5, 6]))) # inspect for non printable ASCII

# Tuples
tuple = {:ok, "hello"}
IO.puts(inspect(put_elem(tuple, 1, "world")))
IO.puts(inspect(tuple))
