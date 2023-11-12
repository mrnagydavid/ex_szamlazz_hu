defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill do
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.Transoflex
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.Sprinter
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.PPP
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.MPL

  @type t :: %__MODULE__{}

  defstruct [
    :uticel,
    :futarSzolgalat,
    :vonalkod,
    :megjegyzes,
    :tof,
    :ppp,
    :sprinter,
    :mpl
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      uticel: params[:uticel],
      futarSzolgalat: params[:futarSzolgalat],
      vonalkod: params[:vonalkod],
      megjegyzes: params[:megjegyzes],
      tof: Transoflex.parse(params[:tof]),
      ppp: PPP.parse(params[:ppp]),
      sprinter: Sprinter.parse(params[:sprinter]),
      mpl: MPL.parse(params[:mpl])
    }
  end
end
