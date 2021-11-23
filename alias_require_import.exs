# Alias, require, and import

defmodule Usable do
  def str_length(str) do
    # Alias
    alias String, as: Str

    Str.length(str)
  end


  def odd(n) do
    # Require
    require Integer

    Integer.is_odd(n)
  end

  def duplicate_List(elem, times) do
    # Import
    import List, only: [duplicate: 2]

    duplicate(elem, times)
  end
end

IO.puts(Usable.str_length("Hello world"))
IO.puts(Usable.odd(3))
IO.puts(inspect(Usable.duplicate_List("Hello", 5)))
