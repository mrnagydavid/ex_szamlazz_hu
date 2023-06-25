defmodule ExSzamlazzHu.Modules.CreateInvoice.InvoiceData do
  alias ExSzamlazzHu.Modules.CreateInvoice.Settings
  alias ExSzamlazzHu.Utils.Validator

  @type t :: %__MODULE__{}

  @enforce_keys [:settings]
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
      settings: Settings.parse(params[:settings])
    }
  end

  def validate(struct) do
    %{
      settings: &Settings.validate/1
    }
    |> Validator.validate(struct)
  end
end
