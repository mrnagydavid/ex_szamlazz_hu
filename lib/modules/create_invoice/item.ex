defmodule ExSzamlazzHu.Modules.CreateInvoice.Item do
  alias ExSzamlazzHu.Modules.CreateInvoice.ItemLedger

  @type t() :: %__MODULE__{}

  @enforce_keys [
    :name,
    :quantity,
    :unit,
    :net_unit_price,
    :vat_key,
    :net_value,
    :vat_value,
    :gross_value
  ]
  defstruct [
    :name,
    :identifier,
    :quantity,
    :unit,
    :net_unit_price,
    :vat_key,
    :margin_vat_base,
    :net_value,
    :vat_value,
    :gross_value,
    :comment,
    :item_ledger
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      name: params[:name],
      identifier: params[:identifier],
      quantity: params[:quantity],
      unit: params[:unit],
      net_unit_price: params[:net_unit_price],
      vat_key: params[:vat_key],
      margin_vat_base: params[:margin_vat_base],
      net_value: params[:net_value],
      vat_value: params[:vat_value],
      gross_value: params[:gross_value],
      comment: params[:comment],
      item_ledger: ItemLedger.parse(params[:item_ledger])
    }
  end
end
