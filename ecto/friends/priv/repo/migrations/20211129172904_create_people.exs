defmodule Friends.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :nombre, :string, null: false
      add :age, :integer, default: 0
  end
end
