# Module attributes
defmodule Greeting do
  # Documentation for the current module.
  @moduledoc "Give greetings"
  # Atrinute use like constant
  @greeting "Hello"

  @doc "Say hello to a specific name"
  def greet(name) do
    ~s(#{@greeting} #{name}.)
  end
end

IO.puts(Greeting.greet("Martin"))
