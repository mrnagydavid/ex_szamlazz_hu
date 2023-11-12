defmodule ExSzamlazzHu.Modules.CreateInvoice.InvoiceData do
  @moduledoc false

  alias ExSzamlazzHu.Modules.CreateInvoice.Settings
  alias ExSzamlazzHu.Modules.CreateInvoice.Header
  alias ExSzamlazzHu.Modules.CreateInvoice.Seller
  alias ExSzamlazzHu.Modules.CreateInvoice.Customer
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill
  alias ExSzamlazzHu.Modules.CreateInvoice.Items
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

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    tags = [
      beallitasok: &Settings.to_xml(&1),
      fejlec: &Header.to_xml(&1),
      elado: &Seller.to_xml(&1),
      vevo: &Customer.to_xml(&1),
      fuvarlevel: &Waybill.to_xml(&1),
      tetelek: &Items.to_xml(&1)
    ]

    """
    <?xml version="1.0" encoding="UTF-8"?>
    <xmlszamla
      xmlns="http://www.szamlazz.hu/xmlszamla"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.szamlazz.hu/xmlszamla https://www.szamlazz.hu/szamla/docs/xsds/agent/xmlszamla.xsd"
    >
    #{StructToXML.run(module, tags)}
    </xmlszamla>
    """
  end
end
