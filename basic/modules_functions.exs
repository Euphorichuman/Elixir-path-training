# Modules
defmodule Calculator do
  # Functions
  def sum(a, b \\ 0) do
    a + b
  end

  def subs(a, b) when a > b do
    a - b
  end

  def subs(a, b) when a < b do
    b - a
  end

  def mult(a, b \\ 1) do
    a * b
  end

  def div(a, b) when a > b do
    a / b
  end

  def div(a, b) when a < b do
    b / a
  end
end

IO.puts Calculator.subs(4, 8)
IO.puts Calculator.mult(8)

# Function capturing
hw = &"Hello #{&1}"
IO.puts hw.("World!")
