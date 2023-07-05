defmodule ExSzamlazzHu.Modules.CreateInvoice.Item do
  alias ExSzamlazzHu.Modules.CreateInvoice.ItemLedger
  alias ExSzamlazzHu.Utils.Validator

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

  @spec validate(t()) :: boolean()
  def validate(struct) do
    %{
      name: &is_binary(&1),
      identifier: &(is_nil(&1) or is_binary(&1)),
      quantity: &is_binary(&1),
      unit: &is_binary(&1),
      net_unit_price: &is_binary(&1),
      vat_key: &is_binary(&1),
      margin_vat_base: &(is_nil(&1) or is_binary(&1)),
      net_value: &is_binary(&1),
      vat_value: &is_binary(&1),
      gross_value: &is_binary(&1),
      comment: &(is_nil(&1) or is_binary(&1)),
      item_ledger: &(is_nil(&1) || ItemLedger.validate(&1))
    }
    |> Validator.validate(struct)
  end
end
