PhoenixCalendar
===============

Integrates Phoenix with [Calendar](https://github.com/lau/calendar).

Implements protocols for displaying Calendar
structs such as Date, Time, DateTime, NaiveDateTime
with Phoenix HTML. This will solve errors such as:
`protocol Phoenix.HTML.Safe not implemented for %Calendar.DateTime`

## Example installation with Calendar, Phoenix and Ecto

Add `:phoenix_calendar` and `:calecto` to your deps function
is the `mix.exs` file.

```elixir
defp deps do
  [
   {:phoenix_calendar, "~> 0.1.2"},
   {:calecto, "~> 0.5.0"},
   {:calendar, "~> 0.12"},
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

## Making Calendar easier to use in Phoenix with the use macro

In `web/web.ex`:

Add `use Calendar` for aliases so that in your views, controllers, channels and models you can use `Time`, `Date`, `DateTime`, `NaiveDateTime`, `Strftime`
without prefixing them with Calendar. Instead of `Calendar.DateTime.now_utc` you can just use `DateTime.now_utc`.

```elixir
  def model do
    quote do
      use Ecto.Schema
      use Calecto.Model, usec: true
      use Calendar
  #.....
```

```elixir
  def view do
    quote do
      use Phoenix.View, root: "web/templates"
      use Calendar
  #.....
```

```elixir
  def controller do
    quote do
      use Phoenix.Controller
      use Calendar
  #.....
```

```elixir
  def channel do
    quote do
      use Phoenix.Channel
      use Calendar
  #.....
```

## Ecto not required

If you want use Phoenix with Calendar, but without Ecto, you can just leave out Calecto.
