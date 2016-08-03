defmodule SimpleWebapp.Plug.VersionTracker do
  import Plug.Conn

  def init(opts), do: opts

  @@doc """
  Detect version then bind to request (conn)
  Use this is pipeline chain
  """
  def call(conn, opts) do
    version = Keyword.fetch!(ops, :version)
    assign(conn, :version, version)
  end
end
