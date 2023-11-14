defmodule ExSzamlazzHu.CreateInvoice.Seller do
  @moduledoc false

  alias ExSzamlazzHu.Utils.StructToXML

  @type t :: %__MODULE__{}

  defstruct [
    :bank,
    :bankszamlaszam,
    :emailReplyto,
    :emailTargy,
    :emailSzoveg,
    :alairoNeve
  ]

  @spec parse(map() | nil) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    struct(__MODULE__, params)
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    tags = [
      bank: &"<bank>#{&1}</bank>",
      bankszamlaszam: &"<bankszamlaszam>#{&1}</bankszamlaszam>",
      emailReplyto: &"<emailReplyto>#{&1}</emailReplyto>",
      emailTargy: &"<emailTargy>#{&1}</emailTargy>",
      emailSzoveg: &"<emailSzoveg>#{&1}</emailSzoveg>",
      alairoNeve: &"<alairoNeve>#{&1}</alairoNeve>"
    ]

    """
    <elado>
    #{StructToXML.run(module, tags)}
    </elado>
    """
  end
end
