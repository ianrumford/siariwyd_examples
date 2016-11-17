defmodule SiariwydExamples.Mixfile do
  use Mix.Project

  @version "0.0.1"

  def project do
    [app: :siariwyd_examples,
     version: @version,
     elixir: "~> 1.3",
     description: description,
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end
  def application do
    [applications: [:logger]]
  end
  defp deps do
    [
      {:siariwyd, ">= 0.1.0"},
    ]
  end
  defp package do
    [maintainers: ["Ian Rumford"],
     files: ["lib", "mix.exs", "README*", "LICENSE*"],
     licenses: ["MIT"],
     links: %{github: "https://github.com/ianrumford/siariwyd_examples"}]
  end
  defp description do
    """
    siariwyd_examples: Examples for Sharing and Reusing Elixir Callback Functions between Modules

    The code to go with the [blog post](<http://ianrumford.github.io/elixir/siariwyd/callback/function/share/reuse/2016/11/17/siariwyd.html>)
    """
  end
end
