defmodule ExSzamlazzHu.Factories.ItemFactory do
  alias ExSzamlazzHu.Factories.ItemLedgerFactory

  def get_params(params \\ %{}) do
    %{
      name: "name",
      identifier: "identifier",
      quantity: "1.5",
      unit: "unit",
      net_unit_price: "net_unit_price",
      vat_key: "27",
      margin_vat_base: "margin_vat_base",
      net_value: "100",
      vat_value: "27",
      gross_value: "127",
      comment: "comment",
      item_ledger: nil
    }
    |> Map.merge(params)
    |> maybe_add_item_ledger()
  end

  defp maybe_add_item_ledger(%{item_ledger: nil} = params), do: params

  defp maybe_add_item_ledger(params) do
    Map.put(params, :item_ledger, ItemLedgerFactory.get_params(params[:item_ledger]))
  end
end
