defmodule ExSzamlazzHu.Modules.CreateInvoice.InvoiceData do
  alias ExSzamlazzHu.Modules.CreateInvoice.Settings
  alias ExSzamlazzHu.Modules.CreateInvoice.Header
  alias ExSzamlazzHu.Modules.CreateInvoice.Seller
  alias ExSzamlazzHu.Modules.CreateInvoice.Buyer
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill
  alias ExSzamlazzHu.Modules.CreateInvoice.Item

  @type t :: %__MODULE__{}

  @enforce_keys [:settings, :header, :seller, :buyer, :items]
  defstruct [
    :settings,
    :header,
    :seller,
    :buyer,
    :waybill,
    :items
  ]

  def parse(params) do
    %__MODULE__{
      settings: Settings.parse(params[:settings]),
      header: Header.parse(params[:header]),
      seller: Seller.parse(params[:seller]),
      buyer: Buyer.parse(params[:buyer]),
      waybill: Waybill.parse(params[:waybill]),
      items: Enum.map(params[:items] || [], &Item.parse(&1))
    }
  end
end
