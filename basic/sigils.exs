# Sigils

# For strings: ~s
str = ~s(This is a "sigil".)
IO.puts(str)

# Interpolation
world = "world!"
IO.puts(~s(Hello #{world}))
# Avoid interpolation: ~S
IO.puts(~S(Hello #{world}))

# To convert in lists
list = ~w(Hello world! this is a list from a sigil)
IO.puts(inspect(list))
atom = ~w(Hello world! this is a list from a sigil)a
IO.puts(inspect(atom))

# Sigils for dates
date = ~D(2021-11-23)
day = date.day
_month = date.month
_year = date.year
IO.puts(day)
