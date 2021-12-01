# Unicode

# UTF-8 Enconding
str = "é"
IO.puts String.length(str)
IO.puts length(String.to_charlist(str))
IO.puts byte_size(str)
IO.inspect(str, binaries: :as_binaries)

# Bitstring
x = 1
IO.puts <<x::8>> == <<x::size(8)>>

# Binaries
nonBinarie = <<3::4>> # Non divisible by 8
IO.puts is_bitstring(nonBinarie)
IO.puts is_binary(nonBinarie)

binarie = <<3::8>> #Divisible by 8
IO.puts is_bitstring(binarie)
IO.puts is_binary(binarie)

<<0, 1, xy::binary>> = <<0, 1, 2, 3>>
IO.puts inspect(xy)

# Matching multibyte characters
<<xyz::utf8, _rest::binary>> = "über"
IO.puts xyz == ?ü

# Charlists
IO.puts is_list('hello world!')
IO.puts 'hello ' ++ 'world!' # To concatenate charlists
