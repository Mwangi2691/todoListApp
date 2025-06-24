defmodule TodoListApp.TodoListAppWebFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoListApp.TodoListAppWeb` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        pass: 42
      })
      |> TodoListApp.TodoListAppWeb.create_user()

    user
  end
end
