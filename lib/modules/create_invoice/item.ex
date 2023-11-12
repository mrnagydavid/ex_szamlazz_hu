defmodule ExSzamlazzHu.Modules.CreateInvoice.Item do
  alias ExSzamlazzHu.Modules.CreateInvoice.ItemLedger

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
    %__MODULE__{
      megnevezes: params[:megnevezes],
      azonosito: params[:azonosito],
      mennyiseg: params[:mennyiseg],
      mennyisegiEgyseg: params[:mennyisegiEgyseg],
      nettoEgysegar: params[:nettoEgysegar],
      afakulcs: params[:afakulcs],
      arresAfaAlap: params[:arresAfaAlap],
      nettoErtek: params[:nettoErtek],
      afaErtek: params[:afaErtek],
      bruttoErtek: params[:bruttoErtek],
      megjegyzes: params[:megjegyzes],
      tetelFokonyv: ItemLedger.parse(params[:tetelFokonyv])
    }
  end
end
