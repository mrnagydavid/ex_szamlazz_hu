defmodule ExSzamlazzHu.Modules.CreateInvoice.Items do
  @moduledoc false

  alias ExSzamlazzHu.Modules.CreateInvoice.Items.Item

  def parse(nil), do: []

  def parse(params) do
    Enum.map(params, &Item.parse/1)
  end

  def to_xml(items) do
    rendered_items =
      items
      |> Enum.map(&Item.to_xml/1)
      |> Enum.join("\n")
      |> String.replace("\n\n", "\n")
      |> String.trim()

    """
    <tetelek>
    #{rendered_items}
    </tetelek>
    """
  end
end
