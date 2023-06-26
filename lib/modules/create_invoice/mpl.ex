defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.MPL do
  alias ExSzamlazzHu.Utils.Validator

  @type t :: %__MODULE__{}

  defstruct [
    :buyer_identifier,
    :barcode,
    :weight,
    :extra_services,
    :value_statement
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      buyer_identifier: params[:buyer_identifier],
      barcode: params[:barcode],
      weight: params[:weight],
      extra_services: params[:extra_services],
      value_statement: params[:value_statement]
    }
  end

  @spec validate(t()) :: boolean()
  def validate(struct) do
    %{
      buyer_identifier: &(is_nil(&1) or is_binary(&1)),
      barcode: &(is_nil(&1) or is_binary(&1)),
      weight: &(is_nil(&1) or is_binary(&1)),
      extra_services: &(is_nil(&1) or is_binary(&1)),
      value_statement: &(is_nil(&1) or is_binary(&1))
    }
    |> Validator.validate(struct)
  end
end
