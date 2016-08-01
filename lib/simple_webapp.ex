defmodule SimpleWebapp do
  use Application

  def start(_type, _args) do
    port = Application.get_env(:server_port, :cowboy_port, 8080)
    children = [
        Plug.Adapters.Cowboy.child_spec(:http, SimpleWebapp.Plug.Router, [], port: port)
      ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
