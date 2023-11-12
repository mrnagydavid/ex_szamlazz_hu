defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.PPP do
  @type t :: %__MODULE__{}

  defstruct [
    :vonalkodPrefix,
    :vonalkodPostfix
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      vonalkodPrefix: params[:vonalkodPrefix],
      vonalkodPostfix: params[:vonalkodPostfix]
    }
  end
end
