defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.Transoflex do
  @type t :: %__MODULE__{}

  defstruct [
    :azonosito,
    :shipmentID,
    :csomagszam,
    :countryCode,
    :zip,
    :service
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      azonosito: params[:azonosito],
      shipmentID: params[:shipmentID],
      csomagszam: params[:csomagszam],
      countryCode: params[:countryCode],
      zip: params[:zip],
      service: params[:service]
    }
  end
end
