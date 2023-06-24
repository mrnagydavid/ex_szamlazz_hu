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
