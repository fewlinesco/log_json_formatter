defmodule LogJsonFormatter do
  use Timex

  def format(level, message, timestamp, metadata) do
    %{level: level, timestamp: format_time(timestamp), message: IO.iodata_to_binary(message)}
    |> Map.merge(Enum.into(metadata, %{}))
    |> Poison.encode!
    |> Kernel.<>("\n")
  end

  defp format_time(timestamp) do
    {{year, month, day}, {hour, minute, second, milliseconds}} = timestamp
    {:ok, timestamp} = NaiveDateTime.new(year, month, day, hour, minute, second, (milliseconds * 1000))
    timestamp = Timex.to_datetime(timestamp, :utc)

    Timex.format!(timestamp, "%FT%T.%f%z", :strftime)
  end
end
