# Recursion
defmodule Fibonacci do
  def fib(a, b, n) do
    case n do
      0 ->
        a

      _ ->
        fib(b, a + b, n - 1)
    end
  end
end

IO.puts Fibonacci.fib(1,1,100)
