defmodule AllowedHosts do
  import Plug.Conn, only: [send_resp: 3]

  @allow_all ["*"]

  def init([]), do: @allow_all
  def init(nil), do: @allow_all
  def init(options), do: options

  def call(conn, nil), do: conn
  def call(conn, @allow_all), do: conn

  def call(conn, hosts) when hosts |> is_list do
    unless Enum.member?(hosts, conn.host) do
      conn |> send_resp(400, "Bad request")
    end
  end
end
