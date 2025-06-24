defmodule TodoListApp do
  @moduledoc """
  TodoListApp keeps the contexts that define your domain
  and business logic.
  """

  # Default credentials (you could expand this to a map or DB later)
  @username ""
  @password ""

  # Entry point
  def verify do
    IO.puts("1. Login\n2. Signup")
    input = IO.gets("Choose an option: ") |> String.trim()

    case input do
      "1" ->
        verification()

      "2" ->
        signup()

      _ ->
        IO.puts("Invalid option. Try again.\n")
        verify()
    end
  end

  # Login flow
  def verification do
    IO.puts("Enter your details for verification")

    email= IO.gets("Enter your email: ") |> String.trim()
    pass = IO.gets("Enter your password: ") |> String.trim()

    if email == @username and pass == @password do
      IO.puts("Login successful!\n")
      start()
    else
      IO.puts("Invalid credentials. Try again.\n")
      verification()
    end
  end

  def signup do
    name = IO.gets("Choose a username: ") |> String.trim()
    _pass = IO.gets("Choose a password: ") |> String.trim()

    IO.puts("Signup successful for #{name}. Now log in to continue.\n")
    verification()
  end

  # Main to-do menu
  def start(tasks \\ []) do
    IO.puts("\n\t------ To-Do List --------")
    IO.puts("*** Options ***")
    IO.puts("1. View Tasks\n2. Add Task\n3. Delete Task\n4. Exit")

    input = IO.gets("Choose an option (1-4): ")
    option = String.trim(input)

    case option do
      "1" ->
        view_tasks(tasks)
        start(tasks)

      "2" ->
        new_task = IO.gets("Enter task and date: ") |> String.trim()
        start(tasks ++ [new_task])

      "3" ->
        view_tasks(tasks)
        to_delete = IO.gets("Enter task number to delete: ") |> String.trim()

        case Integer.parse(to_delete) do
          {num, _} when num > 0 and num <= length(tasks) ->
            updated_tasks = List.delete_at(tasks, num - 1)
            start(updated_tasks)

          _ ->
            IO.puts("Invalid task number.\n")
            start(tasks)
        end

      "4" ->
        IO.puts("Goodbye!")

      _ ->
        IO.puts("Invalid option. Try again.")
        start(tasks)
    end
  end

  # Helper to show tasks
  defp view_tasks([]), do: IO.puts("No tasks available.\n")

  defp view_tasks(tasks) do
    IO.puts("\nYour Tasks:")

    Enum.with_index(tasks, 1)
    |> Enum.each(fn {task, i} -> IO.puts("#{i}. #{task}") end)
  end
end
