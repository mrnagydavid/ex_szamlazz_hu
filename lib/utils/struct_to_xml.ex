defmodule ExSzamlazzHu.Utils.StructToXML do
  @moduledoc false

  def convert(module, top_level \\ true) do
    tag = module.__struct__.tag()
    attributes = module.__struct__.attrs()
    content = module.__struct__.content()
    convert(module, tag, attributes, content, top_level)
  end

  def convert(module, tag, attributes, content, top_level \\ true) do
    content =
      content
      |> Enum.map(&get_value_for_tag(module, &1))
      |> Enum.reject(&tag_empty?/1)
      |> Enum.map(&create_xml_element_from_content/1)

    if top_level do
      doc = XmlBuilder.document(tag, attributes, content)
      XmlBuilder.generate(doc) <> "\n"
    else
      XmlBuilder.element(tag, attributes, content)
    end
  end

  defp get_value_for_tag(module, tag) when is_atom(tag), do: {tag, nil, Map.get(module, tag)}
  defp get_value_for_tag(_, other), do: other

  defp tag_empty?({_, _, value}) when is_nil(value), do: true
  defp tag_empty?(_), do: false

  defp create_xml_element_from_content(struct) when is_struct(struct) do
    convert(struct, false)
  end

  defp create_xml_element_from_content({_, _, struct}) when is_struct(struct) do
    convert(struct, false)
  end

  defp create_xml_element_from_content({tag, attrs, list}) when is_list(list) do
    value = Enum.map(list, fn struct -> create_xml_element_from_content(struct) end)
    XmlBuilder.element(tag, attrs, value)
  end

  defp create_xml_element_from_content({tag, attrs, value}) do
    XmlBuilder.element(tag, attrs, value)
  end
end
