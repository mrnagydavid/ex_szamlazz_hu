defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.MPL do
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
end
