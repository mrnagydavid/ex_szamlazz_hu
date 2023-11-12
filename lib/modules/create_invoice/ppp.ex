defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.PPP do
  @type t :: %__MODULE__{}

  defstruct [
    :barcode_prefix,
    :barcode_postfix
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      barcode_prefix: params[:barcode_prefix],
      barcode_postfix: params[:barcode_postfix]
    }
  end
end
