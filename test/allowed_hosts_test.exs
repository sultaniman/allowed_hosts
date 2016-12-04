defmodule AllowedHostsTest do
  use ExUnit.Case
  use Plug.Test

  doctest AllowedHosts

  test "init passes for empty values" do
    assert ["*"] == AllowedHosts.init([])
    assert ["*"] == AllowedHosts.init(nil)
  end

  test "passes for known allowed hosts" do
    allowed_hosts = AllowedHosts.init(["127.0.0.1"])

    conn = conn(:get, "http://127.0.0.1/")
           |> send_resp(200, "ok")

    conn = AllowedHosts.call(conn, allowed_hosts)

    assert conn.state == :sent
    assert conn.status == 200
  end

  test "fails for unknown allowed hosts" do
    allowed_hosts = AllowedHosts.init(["127.0.0.1"])

    conn = conn(:get, "/")
           |> send_resp(200, "ok")

    assert_raise Plug.Conn.AlreadySentError, ~r/already sent/, fn ->
      AllowedHosts.call(conn, allowed_hosts)
      assert String.match?(conn.resp_body, ~r/Bad request/)
    end
  end
end
