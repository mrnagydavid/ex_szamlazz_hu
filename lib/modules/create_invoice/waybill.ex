defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill do
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.Transoflex
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.Sprinter
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.PPP
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.MPL
  alias ExSzamlazzHu.Utils.Validator

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

  @spec validate(t()) :: boolean()
  def validate(struct) do
    %{
      destination: &(is_nil(&1) or is_binary(&1)),
      three_pl_provider: &(is_nil(&1) or is_binary(&1)),
      barcode: &(is_nil(&1) or is_binary(&1)),
      comment: &(is_nil(&1) or is_binary(&1)),
      transoflex: &(is_nil(&1) || Transoflex.validate(&1)),
      ppp: &(is_nil(&1) || PPP.validate(&1)),
      sprinter: &(is_nil(&1) || Sprinter.validate(&1)),
      mpl: &(is_nil(&1) || MPL.validate(&1))
    }
    |> Validator.validate(struct)
  end
end
