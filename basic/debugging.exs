# Debugging

# Inspect
# 1..10
# |> IO.inspect(label: "before")
# |> Enum.map(fn x -> x * 2 end)
# |> IO.inspect(label: "after")
# |> Enum.sum()
# |> IO.inspect(label: "sum")

# For debugger
defmodule Burn do
  def cpu_burns(a, b, c) do
    x = a * 2
    y = b * 3
    z = c * 5

    x + y + z
  end
end
