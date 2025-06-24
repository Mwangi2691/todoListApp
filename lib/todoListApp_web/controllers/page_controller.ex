defmodule TodoListAppWeb.PageController do
  use TodoListAppWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
  def todo(conn, _params) do
   render(conn, :todo)
  end
end
