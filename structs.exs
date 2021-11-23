# Structs
defmodule User do
  # Protected field: 'status' will not be included in the output
  @derive {Inspect, except: [:status]}

  # User struct
  defstruct name: nil, roles: [], status: nil
end

defmodule Main do
  def main do
    # Update struct
    carlo = %User{name: "Carlo", roles: [:manager, :QA], status: "active"}
    IO.puts(inspect(carlo))
  end
end

Main.main()
