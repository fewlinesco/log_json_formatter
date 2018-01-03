defmodule LogJsonFormatter.Mixfile do
  use Mix.Project

  def project do
    [
      app: :log_json_formatter,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
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
      {:poison, "> 0.13.0"},
      {:timex, "~> 3.1.8"}
    ]
  end
end
