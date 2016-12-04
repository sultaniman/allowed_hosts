# AllowedHosts

This [Elixir](http://elixir-lang.org/) [plug](https://github.com/elixir-lang/plug) protects your resources and APIs from [Host header attack](https://www.acunetix.com/vulnerabilities/web/host-header-attack).

## Installation

To use the plug in your projects, edit your mix.exs file and add the project as a dependency:

```elixir
defp deps do
  [
    {:allowed_hosts, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
pipeline :browser do
  plug AllowedHosts, ["example.com", "example2.com"]
  ...
end
```
