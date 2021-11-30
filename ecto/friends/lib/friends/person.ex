defmodule Friends.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field(:name, :string)
    field(:age, :integer, default: 0)
  end

  # Make sure that only fictional character names are allowed
  @fictional_names ["Black Panther", "Wonder Woman", "Spiderman"]
  def validate_fictional_name(changeset) do
    name = get_field(changeset, :name)

    if name in @fictional_names do
      changeset
    else
      add_error(changeset, :name, "is not a superhero")
    end
  end

  # Allow users to sign up without a name, and call them “Anonymous”
  def set_name_if_anonymous(changeset) do
    name = get_field(changeset, :name)

    if is_nil(name) do
      put_change(changeset, :name, "n/a")
    else
      changeset
    end
  end

  def registration_changeset(struct, params) do
    struct
    |> cast(params, [:name, :age])
    |> set_name_if_anonymous()
  end

  def sign_up(params) do
    %Friends.Person{}
    |> Friends.Person.registration_changeset(params)
    |> Friends.Repo.insert()
  end
end
