defmodule Elg.Identity.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :fname, :string
    field :lname, :string
    field :password, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:fname, :lname, :phone, :email, :password])
    |> validate_required([:fname, :lname, :phone, :email, :password])
  end
end
