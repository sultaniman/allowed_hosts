defmodule AllowedHosts.Mixfile do
  use Mix.Project

  def project do
    [
      app: :allowed_hosts,
      version: "0.1.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      package: package,
      description: description,
      docs: [
        extras: ~W(README.md CHANGELOG.md)
      ],
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~>1.3.0"},

      # Dev deps
      {:ex_doc, "~> 0.11", only: :dev},
      {:earmark, "~> 1.0.3", only: :dev},
    ]
  end

  defp description do
    """
    An elixir plug which checks HTTP_HOST header of request against `allowed_hosts`.
    """
  end

  defp package do
    [
      files: ~w(lib mix.exs README.md LICENSE CHANGELOG.md),
      maintainers: ["Sultan Iman"],
      licenses: ["MIT"],
      links: %{
        "Github" => "http://github.com/imanhodjaev/allowed_hosts",
        "Docs"   => "http://hexdocs.pm/allowed_hosts",
      }
    ]
  end
end
