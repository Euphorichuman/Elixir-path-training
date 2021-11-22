# Case
x = 10
case 10 do
  ^x -> IO.puts("Match with 'x'")
  _ -> IO.puts("Don't match")
end

exp = {:ok, "match"}
resCase = case exp do
  {:ok, x} when is_number(x) -> "Number: #{x}"
  {:ok, x} -> "Other type: #{x}"
  {:error, _} -> "Error"
end

IO.puts resCase

# Cond : Like if else
resCond = cond do
  2 == 3 -> "Something went wrong"
  true == false -> "Something went wrong"
  true -> "If everything went well, this should be shown"
end

IO.puts resCond

# If : For one condition
resIf = if true do
  "Truly"
end

IO.puts resIf

# Scooping
xy = 1

scp = if true do
  xy =  xy + 1
end

IO.puts scp
IO.puts xy


# Unless
resUnless = unless true do
  "Falsy"
end

IO.puts resUnless #nil
