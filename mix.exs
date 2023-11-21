defmodule ExSzamlazzHu.MixProject do
  use Mix.Project

  @source_url "https://github.com/mrnagydavid/ex_szamlazz_hu"
  @version "0.1.0"

  def project do
    [
      app: :ex_szamlazz_hu,
      version: @version,
      description: description(),
      source_url: @source_url,
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      docs: docs(),
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/project.plt"}
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:tesla, "== 1.8.0"},
      {:xml_builder, "== 2.2.0"},
      {:hackney, "== 1.20.1", only: [:dev, :test]},
      {:ex_doc, "~> 0.29.4", only: :dev},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev, :test], runtime: false},
      {:faker, "~> 0.17", only: [:test]},
      {:mix_test_watch, "~> 1.1", only: [:dev, :test], runtime: false}
    ]
  end

  defp description do
    """
    A very thin wrapper for the Szamlazz.hu API.
    """
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
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
