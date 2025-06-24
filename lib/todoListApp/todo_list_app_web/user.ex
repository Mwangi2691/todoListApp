defmodule TodoListApp.TodoListAppWeb.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :pass, :integer
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :pass])
    |> validate_required([:email, :pass])
  end
end
