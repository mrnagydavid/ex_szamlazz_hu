defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.Sprinter do
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
end
