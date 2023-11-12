defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.MPL do
  @type t :: %__MODULE__{}

  defstruct [
    :vevokod,
    :vonalkod,
    :tomeg,
    :kulonszolgaltatasok,
    :erteknyilvanitas
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      vevokod: params[:vevokod],
      vonalkod: params[:vonalkod],
      tomeg: params[:tomeg],
      kulonszolgaltatasok: params[:kulonszolgaltatasok],
      erteknyilvanitas: params[:erteknyilvanitas]
    }
  end
end
