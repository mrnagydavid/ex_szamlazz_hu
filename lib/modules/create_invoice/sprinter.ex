defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.Sprinter do
  alias ExSzamlazzHu.Utils.Validator

  @type t :: %__MODULE__{}

  defstruct [
    :identifier,
    :sender_identifier,
    :code_of_direction,
    :package_identifier,
    :barcode_postfix,
    :delivery_deadline
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      identifier: params[:identifier],
      sender_identifier: params[:sender_identifier],
      code_of_direction: params[:code_of_direction],
      package_identifier: params[:package_identifier],
      barcode_postfix: params[:barcode_postfix],
      delivery_deadline: params[:delivery_deadline]
    }
  end

  @spec validate(t()) :: boolean()
  def validate(struct) do
    %{
      identifier: &(is_nil(&1) or is_binary(&1)),
      sender_identifier: &(is_nil(&1) or is_binary(&1)),
      code_of_direction: &(is_nil(&1) or is_binary(&1)),
      package_identifier: &(is_nil(&1) or is_binary(&1)),
      barcode_postfix: &(is_nil(&1) or is_binary(&1)),
      delivery_deadline: &(is_nil(&1) or is_binary(&1))
    }
    |> Validator.validate(struct)
  end
end
