defmodule TodoListApp.TodoListAppWebTest do
  use TodoListApp.DataCase

  alias TodoListApp.TodoListAppWeb

  describe "users" do
    alias TodoListApp.TodoListAppWeb.User

    import TodoListApp.TodoListAppWebFixtures

    @invalid_attrs %{pass: nil, email: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert TodoListAppWeb.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert TodoListAppWeb.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{pass: 42, email: "some email"}

      assert {:ok, %User{} = user} = TodoListAppWeb.create_user(valid_attrs)
      assert user.pass == 42
      assert user.email == "some email"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TodoListAppWeb.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{pass: 43, email: "some updated email"}

      assert {:ok, %User{} = user} = TodoListAppWeb.update_user(user, update_attrs)
      assert user.pass == 43
      assert user.email == "some updated email"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = TodoListAppWeb.update_user(user, @invalid_attrs)
      assert user == TodoListAppWeb.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = TodoListAppWeb.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> TodoListAppWeb.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = TodoListAppWeb.change_user(user)
    end
  end
end
