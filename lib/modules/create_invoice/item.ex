defmodule ExSzamlazzHu.CreateInvoice.Items.Item do
  @moduledoc false

  alias ExSzamlazzHu.CreateInvoice.Items.Item.ItemLedger
  alias ExSzamlazzHu.Utils.StructToXML

  @type t() :: %__MODULE__{}

  @enforce_keys [
    :megnevezes,
    :mennyiseg,
    :mennyisegiEgyseg,
    :nettoEgysegar,
    :afakulcs,
    :nettoErtek,
    :afaErtek,
    :bruttoErtek
  ]
  defstruct [
    :megnevezes,
    :azonosito,
    :mennyiseg,
    :mennyisegiEgyseg,
    :nettoEgysegar,
    :afakulcs,
    :arresAfaAlap,
    :nettoErtek,
    :afaErtek,
    :bruttoErtek,
    :megjegyzes,
    :tetelFokonyv
  ]

  @spec parse(map() | nil) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    __MODULE__
    |> struct(Map.drop(params, [:tetelFokonyv]))
    |> Map.put(:tetelFokonyv, ItemLedger.parse(params[:tetelFokonyv]))
  end

  def tag(), do: :tetel

  def attrs(), do: nil

  def content() do
    [
      :megnevezes,
      :azonosito,
      :mennyiseg,
      :mennyisegiEgyseg,
      :nettoEgysegar,
      :afakulcs,
      :arresAfaAlap,
      :nettoErtek,
      :afaErtek,
      :bruttoErtek,
      :megjegyzes,
      :tetelFokonyv
    ]
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    StructToXML.convert(module)
  end
end
