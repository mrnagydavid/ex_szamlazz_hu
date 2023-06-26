defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.Transoflex do
  alias ExSzamlazzHu.Utils.Validator

  @type t :: %__MODULE__{}

  defstruct [
    :identifier,
    :shipment_id,
    :package_identifier,
    :country_code,
    :zip,
    :service
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      identifier: params[:identifier],
      shipment_id: params[:shipment_id],
      package_identifier: params[:package_identifier],
      country_code: params[:country_code],
      zip: params[:zip],
      service: params[:service]
    }
  end

  @spec validate(t()) :: boolean()
  def validate(struct) do
    %{
      identifier: &(is_nil(&1) or is_binary(&1)),
      shipment_id: &(is_nil(&1) or is_binary(&1)),
      package_identifier: &(is_nil(&1) or is_binary(&1)),
      country_code: &(is_nil(&1) or is_binary(&1)),
      zip: &(is_nil(&1) or is_binary(&1)),
      service: &(is_nil(&1) or is_binary(&1))
    }
    |> Validator.validate(struct)
  end
end
