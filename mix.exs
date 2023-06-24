defmodule ExSzamlazzHu.MixProject do
  use Mix.Project

  @source_url "https://github.com/mrnagydavid/ex_szamlazz_hu"
  @version "0.1.0"

  def project do
    [
      app: :ex_szamlazz_hu,
      version: @version,
      description: "Szamlazz.hu client",
      name: "ExSzamlazzHu",
      source_url: @source_url,
      elixir: "~> 1.14",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ExSzamlazzHu.Application, []}
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.29.4", only: :dev},
      {:finch, "~> 0.16.0"}
    ]
  end

  defp description do
    """
    Szamlazz.hu client for Elixir
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["David Nagy", "Mikhail Alekseev"],
      licenses: ["MIT"],
      links: %{GitHub: @source_url},
      description: description()
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url,
      extras: ["README.md"]
    ]
  end
end
