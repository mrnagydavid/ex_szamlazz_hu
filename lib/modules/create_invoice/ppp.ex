defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.PPP do
  alias ExSzamlazzHu.Utils.Validator

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

  @spec validate(t()) :: boolean()
  def validate(struct) do
    %{
      barcode_prefix: &(is_nil(&1) or is_binary(&1)),
      barcode_postfix: &(is_nil(&1) or is_binary(&1))
    }
    |> Validator.validate(struct)
  end
end
