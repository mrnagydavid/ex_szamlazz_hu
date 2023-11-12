defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.Transoflex do
  alias ExSzamlazzHu.Utils.StructToXML

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
    struct(__MODULE__, params)
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    tags = [
      azonosito: &"<azonosito>#{&1}</azonosito>",
      shipmentID: &"<shipmentID>#{&1}</shipmentID>",
      csomagszam: &"<csomagszam>#{&1}</csomagszam>",
      countryCode: &"<countryCode>#{&1}</countryCode>",
      zip: &"<zip>#{&1}</zip>",
      service: &"<service>#{&1}</service>"
    ]

    """
    <tof>
    #{StructToXML.run(module, tags)}
    </tof>
    """
  end
end
