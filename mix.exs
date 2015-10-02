defmodule PhoenixCalendar.Mixfile do
  use Mix.Project

  @version "0.1.2"

  def project do
    [app: :phoenix_calendar,
     version: @version,
     elixir: "~> 1.0",
     package: package,
     description: "Integration between Phoenix & Calendar",
     deps: deps]
  end

  def application do
    [applications: [:logger, :calendar]]
  end

  defp deps do
    [{:phoenix_html, "~> 2.0", optional: true},
     {:calendar, "~> 0.9 or ~> 0.10.0"},
    ]
  end

  defp package do
    [contributors: ["Lau Taarnskov"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/lau/phoenix_calendar"},
    ]
  end
end
