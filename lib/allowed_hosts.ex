defmodule AllowedHosts do
  @moduledoc """
  This plug protects your websites and APIs from "Host header attack".

  ## Example

    pipeline :browser do
      plug AllowedHosts, ["example.com", "example2.com"]
    end

  """
  import Plug.Conn, only: [send_resp: 3, halt: 1]

  @allow_all ["*"]

  @doc false
  def init([]), do: @allow_all
  def init(nil), do: @allow_all
  def init(options), do: options

  @doc false
  def call(conn, nil), do: conn
  def call(conn, @allow_all), do: conn

  def call(conn, hosts) when hosts |> is_list do
    unless Enum.member?(hosts, conn.host) do
      conn
      |> send_resp(400, "Bad request")
      |> halt()
    else
      conn
    end
  end
end
