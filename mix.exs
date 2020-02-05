defmodule AllowedHosts.Mixfile do
  use Mix.Project

  @vsn "0.1.0"

  @package [
    files: ~w(lib mix.exs README.md LICENSE CHANGELOG.md),
    maintainers: ["Sultan Iman"],
    licenses: ["MIT"],
    links: %{
      "Github" => "http://github.com/imanhodjaev/allowed_hosts",
      "Docs"   => "http://hexdocs.pm/allowed_hosts"
    }
  ]

  @description "Elixir plug to protect your APIs from Host header attacks."

  @deps [
    {:cowboy, "~> 2.7"},
    {:plug, "~> 1.8.0"},

    # Dev deps
    {:ex_doc, "~> 0.21.3", only: :dev},
    {:earmark, "~> 1.4", only: :dev}
  ]

  def project do
    [
      app: :allowed_hosts,
      version: @vsn,
      elixir: "~> 1.8",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      package: @package,
      description: @description,
      docs: [extras: ~W(README.md CHANGELOG.md)],
      deps: @deps
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end
end
