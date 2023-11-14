defmodule ExSzamlazzHu.CreateInvoice.Items do
  @moduledoc false

  alias ExSzamlazzHu.CreateInvoice.Items.Item

  def parse(nil), do: []

  def parse(params) do
    Enum.map(params, &Item.parse/1)
  end

  def to_xml(items) do
    rendered_items =
      items
      |> Enum.map_join("\n", &Item.to_xml/1)
      |> String.replace("\n\n", "\n")
      |> String.trim()

    """
    <tetelek>
    #{rendered_items}
    </tetelek>
    """
  end
end
