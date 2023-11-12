defmodule ExSzamlazzHu.Utils.StructToXML do
  @moduledoc false

  def run(struct, params) do
    params
    |> Enum.map(fn {tag, fun} ->
      case Map.get(struct, tag) do
        nil -> nil
        value -> fun.(value)
      end
    end)
    |> Enum.reject(&is_nil/1)
    |> Enum.join("\n")
    |> String.replace("\n\n", "\n")
    |> String.trim()
  end
end
