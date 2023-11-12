defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.Transoflex do
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
end
