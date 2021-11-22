# Case
x = 10

case 10 do
  ^x -> IO.puts("Match with 'x'")
  _ -> IO.puts("Don't match")
end

exp = {:ok, "match"}

res_case =
  case exp do
    {:ok, x} when is_number(x) -> "Number: #{x}"
    {:ok, x} -> "Other type: #{x}"
    {:error, _} -> "Error"
  end

IO.puts(res_case)

# Cond : Like if else
res_cond =
  cond do
    2 == 3 -> "Something went wrong"
    true == false -> "Something went wrong"
    true -> "If everything went well, this should be shown"
  end

IO.puts(res_cond)

# If : For one condition
res_if =
  if true do
    "Truly"
  end

IO.puts(res_if)

# Scooping
xy = 1

scp =
  if true do
    xy = xy + 1
  end

IO.puts(scp)
IO.puts(xy)

# Unless
res_unless =
  unless true do
    "Falsy"
  end

# nil
IO.puts(res_unless)
