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

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    __MODULE__
    |> struct(Map.drop(params, [:tetelFokonyv]))
    |> Map.put(:tetelFokonyv, ItemLedger.parse(params[:tetelFokonyv]))
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    tags = [
      megnevezes: &"<megnevezes>#{&1}</megnevezes>",
      azonosito: &"<azonosito>#{&1}</azonosito>",
      mennyiseg: &"<mennyiseg>#{&1}</mennyiseg>",
      mennyisegiEgyseg: &"<mennyisegiEgyseg>#{&1}</mennyisegiEgyseg>",
      nettoEgysegar: &"<nettoEgysegar>#{&1}</nettoEgysegar>",
      afakulcs: &"<afakulcs>#{&1}</afakulcs>",
      arresAfaAlap: &"<arresAfaAlap>#{&1}</arresAfaAlap>",
      nettoErtek: &"<nettoErtek>#{&1}</nettoErtek>",
      afaErtek: &"<afaErtek>#{&1}</afaErtek>",
      bruttoErtek: &"<bruttoErtek>#{&1}</bruttoErtek>",
      megjegyzes: &"<megjegyzes>#{&1}</megjegyzes>",
      tetelFokonyv: &ItemLedger.to_xml(&1)
    ]

    """
    <tetel>
    #{StructToXML.run(module, tags)}
    </tetel>
    """
  end
end
