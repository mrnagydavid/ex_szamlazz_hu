defmodule ExSzamlazzHu.Modules.CreateInvoice.Seller do
  @type t :: %__MODULE__{}

  defstruct [
    :bank,
    :bankszamlaszam,
    :emailReplyto,
    :emailTargy,
    :emailSzoveg,
    :alairoNeve
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      bank: params[:bank],
      bankszamlaszam: params[:bankszamlaszam],
      emailReplyto: params[:emailReplyto],
      emailTargy: params[:emailTargy],
      emailSzoveg: params[:emailSzoveg],
      alairoNeve: params[:alairoNeve]
    }
  end
end
