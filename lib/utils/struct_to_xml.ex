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
      |> Enum.map(fn
        tag when is_atom(tag) -> {tag, nil, Map.get(module, tag)}
        other -> other
      end)
      |> Enum.reject(fn
        {_, _, value} -> is_nil(value)
        _ -> false
      end)
      |> Enum.map(fn
        struct when is_struct(struct) ->
          convert(struct, false)

        {_, _, struct} when is_struct(struct) ->
          convert(struct, false)

        {tag, attrs, list} when is_list(list) ->
          value = Enum.map(list, fn struct -> convert(struct, false) end)
          {tag, attrs, value}

        {tag, attrs, value} ->
          XmlBuilder.element(tag, attrs, value)
      end)

    if top_level do
      doc = XmlBuilder.document(tag, attributes, content)
      XmlBuilder.generate(doc) <> "\n"
    else
      XmlBuilder.element(tag, attributes, content)
    end
  end
end
