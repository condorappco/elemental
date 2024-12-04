defmodule Elemental.MixProject do
  use Mix.Project

  def project do
    [
      app: :elemental,
      description: "A @condorappco library for standardizing Phoenix components",
      version: "0.0.1",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:gettext, "~> 0.23"},
      {:heroicons, "~> 0.5.6"},
      {:phoenix, "~> 1.7"},
      {:phoenix_live_view, "~> 1.0"},
      {:twix, "~> 0.3"}
    ]
  end
end
