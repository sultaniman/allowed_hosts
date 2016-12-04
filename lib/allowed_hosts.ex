defmodule AllowedHosts do
  @moduledoc """
  This plug protects your websites and APIs from "Host header attack".

  ## Example

    pipeline :browser do
      plug AllowedHosts, ["example.com", "example2.com"]
    end

  """
  import Plug.Conn, only: [send_resp: 3]

  @allow_all ["*"]

  @doc "Callback implementation for Plug.init/1"
  def init([]), do: @allow_all
  def init(nil), do: @allow_all
  def init(options), do: options

  @doc "Callback implementation for Plug.call/2"
  def call(conn, nil), do: conn
  def call(conn, @allow_all), do: conn

  def call(conn, hosts) when hosts |> is_list do
    unless Enum.member?(hosts, conn.host) do
      conn |> send_resp(400, "Bad request")
    end
  end
end
