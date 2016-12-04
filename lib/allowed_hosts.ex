defmodule AllowedHosts do
	@allow_all ["*"]

	def init([]), do: @allow_all
	def init(options), do: options

	def call(conn, hosts) when hosts |> is_list do
		host = conn.get_header("host")
		
		unless Enum.member?(hosts, hosts) do
			# TODO
		end
	end
end
