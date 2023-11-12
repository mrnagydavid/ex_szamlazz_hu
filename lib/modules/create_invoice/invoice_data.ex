defmodule ExSzamlazzHu.Modules.CreateInvoice.InvoiceData do
  alias ExSzamlazzHu.Modules.CreateInvoice.Settings
  alias ExSzamlazzHu.Modules.CreateInvoice.Header
  alias ExSzamlazzHu.Modules.CreateInvoice.Seller
  alias ExSzamlazzHu.Modules.CreateInvoice.Customer
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill
  alias ExSzamlazzHu.Modules.CreateInvoice.Item

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
      tetelek: Enum.map(params[:tetelek] || [], &Item.parse(&1))
    }
  end
end
