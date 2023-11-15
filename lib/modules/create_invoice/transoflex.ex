defmodule ExSzamlazzHu.CreateInvoice.Waybill.Transoflex do
  @moduledoc false

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

  @spec parse(map() | nil) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    struct(__MODULE__, params)
  end

  def tag(), do: :tof

  def attrs(), do: nil

  def content() do
    [
      :azonosito,
      :shipmentID,
      :csomagszam,
      :countryCode,
      :zip,
      :service
    ]
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    StructToXML.convert(module)
  end
end
