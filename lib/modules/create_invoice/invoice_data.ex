defmodule ExSzamlazzHu.Modules.CreateInvoice.InvoiceData do
  alias ExSzamlazzHu.Modules.CreateInvoice.Customer
  alias ExSzamlazzHu.Modules.CreateInvoice.Item

  @derive {Inspect, except: [:agent_key]}

  @type t :: %__MODULE__{
          agent_key: String.t(),
          completion_date: String.t(),
          payment_deadline: String.t(),
          method_of_payment: String.t(),
          order_id: String.t(),
          currency: String.t(),
          language: String.t(),
          comment: String.t(),
          is_proforma: String.t(),
          is_paid: String.t(),
          customer: Customer.t(),
          items: list(Item.t())
        }

  defstruct [
    :agent_key,
    :completion_date,
    :payment_deadline,
    :method_of_payment,
    :order_id,
    :currency,
    :language,
    :comment,
    :is_proforma,
    :is_paid,
    :customer,
    :items
  ]

  def parse(params) do
    struct(%__MODULE__{}, Map.drop(params, [:customer, :items]))
    |> Map.put(:customer, Customer.parse(params[:customer]))
    |> Map.put(:items, Enum.map(params[:items], &Item.parse/1))
  end
end

defmodule ExSzamlazzHu.Modules.CreateInvoice.Customer do
  @type t() :: %__MODULE__{
          name: String.t(),
          zip: String.t(),
          city: String.t(),
          country: String.t(),
          address: String.t(),
          email: String.t()
        }

  defstruct [
    :name,
    :zip,
    :city,
    :country,
    :address,
    :email
  ]

  def parse(params) do
    struct(%__MODULE__{}, params)
  end
end

defmodule ExSzamlazzHu.Modules.CreateInvoice.Item do
  @type t() :: %__MODULE__{
          name: String.t(),
          quantity: String.t(),
          unit: String.t(),
          net_unit_price: String.t(),
          vat_key: String.t(),
          vat_cost: String.t(),
          net_cost: String.t(),
          gross_cost: String.t()
        }

  defstruct [
    :name,
    :quantity,
    :unit,
    :net_unit_price,
    :vat_key,
    :vat_cost,
    :net_cost,
    :gross_cost
  ]

  def parse(params) do
    struct(%__MODULE__{}, params)
  end
end
