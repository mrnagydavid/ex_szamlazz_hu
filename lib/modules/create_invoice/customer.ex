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
