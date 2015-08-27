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
   {:phoenix_calendar, "~> 0.1.1"},
   {:calecto, "~> 0.3.9"},
  ]
end
```

Then run `mix deps.get` which will fetch the new packages via the hex package manager.

Also add `tzdata` to the list of applications in the `mix.exs` file:

```elixir
  def application do
    [applications: [:phoenix, :phoenix_html, :cowboy, :logger,
                    :phoenix_ecto, :postgrex, :tzdata]]
  end
```

## Making Calendar easier to use in Phoenix with the use macro

In `web/web.ex`:

Add `use Calendar` for aliases so that in your views, controllers and models you can use `Time`, `Date`, `DateTime`, `NaiveDateTime`, `Strftime`
without prefixing them with Calendar. Instead of `Calendar.DateTime.now_utc` you can just use `DateTime.now_utc`.

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
  def model do
    quote do
      use Ecto.Model
      use Calecto.Model, usec: true
      use Calendar
    end
  end
```

For models we also add a line to use Calecto.Model. This adds Calendar
functionality to the Ecto models.

## Ecto not required

If you want use Phoenix with Calendar, but without Ecto, you can just leave out Calecto.
