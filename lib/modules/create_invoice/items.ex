defmodule ExSzamlazzHu.CreateInvoice.Items do
  @moduledoc false

  alias ExSzamlazzHu.CreateInvoice.Items.Item
  alias ExSzamlazzHu.Utils.StructToXML

  defstruct [
    :tetelek
  ]

  def parse(nil), do: []

  def parse(params) do
    items = Enum.map(params, &Item.parse/1)
    Map.put(%__MODULE__{}, :tetelek, items)
  end

  def tag(), do: :tetelek

  def attrs(), do: nil

  def content(module = %__MODULE__{}) do
    module.tetelek
  end

  def to_xml(module = %__MODULE__{}) do
    StructToXML.convert(module)
  end
end
