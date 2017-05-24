defmodule Kronos.Mixfile do
  use Mix.Project

  def project do
    [
      app: :kronos,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: description(),
      source_url: "https://github.com/aguxez/kronos",
      package: package()
    ]
  end

  def application do
    [extra_applications: [:logger, :httpoison, :poison],
     mod: {Kronos.Application, []}]
  end

  defp deps do
    [
      {:httpoison, "~> 0.11.2"},
      {:poison, "~> 3.1"},
      {:credo, "~> 0.7.4", only: [:dev, :test]},
      {:ex_doc, "~> 0.15.1", only: [:dev]}
    ]
  end

  defp description do
    """
    Simple wrapper around Steam's ReST API.
    """
  end

  defp package do
    [
      maintainers: ["Miguel Diaz"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/aguxez/kronos"}
    ]
  end
end
