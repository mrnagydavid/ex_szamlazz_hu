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
      {:tesla, "~> 1.7.0"},
      {:ex_doc, "~> 0.29.4", only: :dev},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev, :test], runtime: false}
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
