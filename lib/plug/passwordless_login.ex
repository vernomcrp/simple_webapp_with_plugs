defmodule SimpleWebapp.Plug.PaswordlessLogin do
  import Plug.Conn
  # alias SimpleWebapp.{Repo, User}
  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    conn
    |> assign_current_user(user_id)
  end

  defp assign_current_user(conn, nil) do
    conn
    |> assign(:current_user, nil)
  end

  defp assign_current_user(conn, user_id) do
    # user = Repo.get(User, user_id)
    # assign(conn, :current_user, user)
    conn
    |> assign(:current_user, %{name: "fake-user"})
  end
