PhoenixCalendar
===============

Integrates Phoenix with [Calendar](https://github.com/lau/calendar).

Implements protocols for displaying Calendar
structs such as Date, Time, DateTime, NaiveDateTime
with Phoenix HTML. This will solve errors such as:
`protocol Phoenix.HTML.Safe not implemented for %Calendar.DateTime`

## Elixir 1.3, Phoenix 1.2 and Calendar 0.16+

*For Calendar 0.16.0 and up, this library is not needed in Phoenix 1.2 and up.*

## Example installation with Calendar, Phoenix and Ecto

Add `:phoenix_calendar` and `:calecto` to your deps function
is the `mix.exs` file.

```elixir
defp deps do
  [
   {:phoenix_calendar, "~> 0.1.2"},
   {:calecto, "~> 0.5.2"},
   {:calendar, "~> 0.13"},
  ]
end
```

Then run `mix deps.get` which will fetch the new packages via the hex package manager.

Also add `calendar`, `calecto` and `phoenix_calendar` to the list of applications in the `mix.exs` file:

```elixir
  def application do
    [applications: [:phoenix, :phoenix_html, :cowboy, :logger,
                    :phoenix_ecto, :postgrex,
                    :calendar, :calecto, :phoenix_calendar ]]
  end
```

## Making all Phoenix models use Calecto.Schema

In `web/web.ex`:


```elixir
  def model do
    quote do
      use Ecto.Schema
      use Calecto.Schema, usec: true
  #.....
```

## Ecto not required

If you want use Phoenix with Calendar, but without Ecto, you can just leave out Calecto.
