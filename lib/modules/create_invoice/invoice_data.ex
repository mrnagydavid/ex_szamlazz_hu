defmodule ExSzamlazzHu.CreateInvoice.InvoiceData do
  @moduledoc false

  alias ExSzamlazzHu.CreateInvoice.Settings
  alias ExSzamlazzHu.CreateInvoice.Header
  alias ExSzamlazzHu.CreateInvoice.Seller
  alias ExSzamlazzHu.CreateInvoice.Customer
  alias ExSzamlazzHu.CreateInvoice.Waybill
  alias ExSzamlazzHu.CreateInvoice.Items
  alias ExSzamlazzHu.Utils.StructToXML

  @type t :: %__MODULE__{}

  @enforce_keys [:beallitasok, :fejlec, :elado, :vevo, :tetelek]
  defstruct [
    :beallitasok,
    :fejlec,
    :elado,
    :vevo,
    :fuvarlevel,
    :tetelek
  ]

  def parse(params) do
    %__MODULE__{
      beallitasok: Settings.parse(params[:beallitasok]),
      fejlec: Header.parse(params[:fejlec]),
      elado: Seller.parse(params[:elado]),
      vevo: Customer.parse(params[:vevo]),
      fuvarlevel: Waybill.parse(params[:fuvarlevel]),
      tetelek: Items.parse(params[:tetelek])
    }
  end

  def tag(), do: :xmlszamla

  def attrs(),
    do: %{
      "xmlns" => "http://www.szamlazz.hu/xmlszamla",
      "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance",
      "xsi:schemaLocation" => "http://www.szamlazz.hu/xmlszamla https://www.szamlazz.hu/szamla/docs/xsds/agent/xmlszamla.xsd"
    }

  def content(_) do
    [
      :beallitasok,
      :fejlec,
      :elado,
      :vevo,
      :fuvarlevel,
      :tetelek
    ]
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    StructToXML.convert(module)
  end
end
