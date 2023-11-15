defmodule ExSzamlazzHu.CreateInvoice.Items do
  @moduledoc false

  alias ExSzamlazzHu.CreateInvoice.Items.Item
  alias ExSzamlazzHu.Utils.StructToXML

  defstruct []

  def parse(nil), do: []

  def parse(params) do
    Enum.map(params, &Item.parse/1)
  end

  def tag(), do: :tetelek

  def attrs(), do: nil

  def content(items) do
    items
  end

  def to_xml(items) do
    StructToXML.convert(%__MODULE__{}, tag(), attrs(), items)
  end
end
