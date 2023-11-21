defmodule ExSzamlazzHu.Utils.StructToXML do
  @moduledoc false

  def convert(module) do
    module
    |> convert_to_xml_builder_structure()
    |> XmlBuilder.document()
    |> XmlBuilder.generate()
    |> Kernel.<>("\n")
  end

  defp convert_to_xml_builder_structure(module) do
    struct = module.__struct__
    tag = struct.tag()
    attrs = struct.attrs()

    content =
      module
      |> struct.content()
      |> map_to_tuples_of_tag_and_content(module)
      |> reject_empty_tags()
      |> convert_to_xml_elements()

    XmlBuilder.element(tag, attrs, content)
  end

  defp map_to_tuples_of_tag_and_content(content, module) do
    Enum.map(content, fn value ->
      case value do
        submodule when is_struct(submodule) -> {nil, submodule}
        tag when is_atom(tag) -> {tag, Map.get(module, tag)}
      end
    end)
  end

  defp reject_empty_tags(content) do
    Enum.reject(content, fn {_tag, content} -> is_nil(content) end)
  end

  defp convert_to_xml_elements(contents) do
    Enum.map(contents, fn {tag, content} ->
      case content do
        submodule when is_struct(submodule) -> convert_to_xml_builder_structure(submodule)
        value -> XmlBuilder.element(tag, nil, value)
      end
    end)
  end
end
