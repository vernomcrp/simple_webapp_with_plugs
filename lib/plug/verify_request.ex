defmodule SimpleWebapp.Plug.VerifyRequest do
  import Plug.Conn

  defmodule IncompleteRequestError do
    @moduledoc """
    Error raised when a required field is missing.
    """
    defexception message: "", plug_status: 400
  end

  def init(options), do: options

  def call(%Plug.Conn{request_path: path} = conn, opts) do
    if path in opts[:paths] do
      conn.body_params
      |> verify_request!(opts[:fields])
    end

    conn
  end

  defp verify_request!(body_params, fields) do
    verified =
    body_params
    |> Map.keys
    |> contains_fields?(fields)

    unless verified do
      raise IncompleteRequestError
    end
  end

  defp contains_fields?(keys, fields) do
    Enum.all?(fields, fn(x) -> x in keys end)
  end
end
