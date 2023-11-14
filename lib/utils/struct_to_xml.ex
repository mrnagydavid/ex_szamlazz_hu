defmodule ExSzamlazzHu.Utils.StructToXML do
  @moduledoc false

  @type tag_converter_param :: {atom(), (any() -> String.t())}

  @spec run(struct(), params :: [tag_converter_param]) :: String.t()
  def run(struct, params) do
    params
    |> Enum.map(&apply_xml_producing_funs(&1, struct))
    |> Enum.reject(&is_nil/1)
    |> Enum.join("\n")
    |> String.replace("\n\n", "\n")
    |> String.trim()
  end

  defp apply_xml_producing_funs({tag, fun}, struct) do
    case Map.get(struct, tag) do
      nil -> nil
      value -> fun.(value)
    end
  end
end
