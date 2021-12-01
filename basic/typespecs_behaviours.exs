# Typespecs and behaviours

# Specs
defmodule Calculator do
  @typedoc """
  Just a number followed by a string.
  """
  @type number_with_remark :: {number, String.t()}

  @spec add(number, number) :: number_with_remark
  def add(x, y), do: {x + y, "add"}

  @spec multiply(number, number) :: number_with_remark
  def multiply(x, y), do: {x * y, "multiply("}
end

IO.puts(inspect(Calculator.add(1, 1)))

# Behaviours
defmodule Worker do
  @callback init(state :: term) :: {:ok, new_state :: term} | {:error, reason :: term}
  @callback perform(args :: term, state :: term) ::
              {:ok, result :: term, new_state :: term}
              | {:error, reason :: term, new_state :: term}
end

# Module to compress an array of files: Taken from https://github.com/elixirschool/elixirschool/blob/master/lessons/es/advanced/behaviours.md
defmodule Compressor do
  # Add behavior
  @behaviour Worker

  def init(opts), do: {:ok, opts}

  def perform(payload, opts) do
    payload
    |> compress
    |> respond(opts)
  end

  defp compress({name, files}), do: :zip.create(name, files)

  defp respond({:ok, path}, opts), do: {:ok, path, opts}
  defp respond({:error, reason}, opts), do: {:error, reason, opts}
end
