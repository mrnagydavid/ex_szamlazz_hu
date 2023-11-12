defmodule ExSzamlazzHu.Factories.ItemFactory do
  alias ExSzamlazzHu.Factories.ItemLedgerFactory

  def get_params(params \\ %{}) do
    %{
      megnevezes: "name",
      azonosito: "identifier",
      mennyiseg: "1.5",
      mennyisegiEgyseg: "unit",
      nettoEgysegar: "net_unit_price",
      afakulcs: "27",
      arresAfaAlap: "margin_vat_base",
      nettoErtek: "100",
      afaErtek: "27",
      bruttoErtek: "127",
      megjegyzes: "comment",
      tetelFokonyv: nil
    }
    |> Map.merge(params)
    |> maybe_add_item_ledger()
  end

  defp maybe_add_item_ledger(%{tetelFokonyv: nil} = params), do: params

  defp maybe_add_item_ledger(params) do
    Map.put(params, :tetelFokonyv, ItemLedgerFactory.get_params(params[:tetelFokonyv]))
  end
end
