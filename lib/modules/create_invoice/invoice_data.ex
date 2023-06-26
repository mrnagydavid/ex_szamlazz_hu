defmodule ExSzamlazzHu.Modules.CreateInvoice.InvoiceData do
  alias ExSzamlazzHu.Modules.CreateInvoice.Settings
  alias ExSzamlazzHu.Modules.CreateInvoice.Header
  alias ExSzamlazzHu.Modules.CreateInvoice.Seller
  alias ExSzamlazzHu.Modules.CreateInvoice.Buyer
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill
  alias ExSzamlazzHu.Modules.CreateInvoice.Item
  alias ExSzamlazzHu.Utils.Validator

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

  def validate(struct) do
    %{
      settings: &Settings.validate/1,
      header: &Header.validate(&1),
      seller: &Seller.validate(&1),
      buyer: &Buyer.validate(&1),
      waybill: &(is_nil(&1) || Waybill.validate(&1)),
      items: &Item.validate(&1)
    }
    |> Validator.validate(struct)
  end
end
