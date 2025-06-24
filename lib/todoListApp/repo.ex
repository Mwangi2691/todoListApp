defmodule TodoListApp.Repo do
  use Ecto.Repo,
    otp_app: :todoListApp,
    adapter: Ecto.Adapters.Postgres
end
