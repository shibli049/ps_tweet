defmodule PsTweet.Mixfile do
  use Mix.Project

  def project do
    [app: :ps_tweet,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :quantum, :extwitter],
     mod: {PsTweet.Application, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:credo, "~> 0.7.2"},
    {:quantum, "~> 1.9"},
    {:extwitter, "~> 0.7.3"},
    {:oauth, github: "tim/erlang-oauth"}]
  end
end
