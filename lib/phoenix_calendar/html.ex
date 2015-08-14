if Code.ensure_loaded?(Phoenix.HTML) do
  defimpl Phoenix.HTML.Safe, for: [Calendar.DateTime] do
    def to_iodata(t) do
      "#{Calendar.Strftime.strftime!(t, "%F %T")} #{t.timezone}"
    end
  end
  defimpl Phoenix.HTML.Safe, for: [Calendar.NaiveDateTime] do
    def to_iodata(t) do
      Calendar.Strftime.strftime!(t, "%F %T")
    end
  end
  defimpl Phoenix.HTML.Safe, for: [Calendar.Date] do
    def to_iodata(t) do
      Calendar.Strftime.strftime!(t, "%F")
    end
  end
  defimpl Phoenix.HTML.Safe, for: [Calendar.Time] do
    def to_iodata(t) do
      Calendar.Strftime.strftime!(t, "%T")
    end
  end
end
