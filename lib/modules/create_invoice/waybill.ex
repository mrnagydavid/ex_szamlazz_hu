defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill do
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.Transoflex
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.Sprinter
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.PPP
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.MPL

  @type t :: %__MODULE__{}

  defstruct [
    :destination,
    :three_pl_provider,
    :barcode,
    :comment,
    :transoflex,
    :ppp,
    :sprinter,
    :mpl
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      destination: params[:destination],
      three_pl_provider: params[:three_pl_provider],
      barcode: params[:barcode],
      comment: params[:comment],
      transoflex: Transoflex.parse(params[:transoflex]),
      ppp: PPP.parse(params[:ppp]),
      sprinter: Sprinter.parse(params[:sprinter]),
      mpl: MPL.parse(params[:mpl])
    }
  end
end
