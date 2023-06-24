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
