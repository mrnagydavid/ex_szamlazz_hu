defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.MPL do
  alias ExSzamlazzHu.Utils.StructToXML

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
    struct(__MODULE__, params)
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    tags = [
      vevokod: &"<vevokod>#{&1}</vevokod>",
      vonalkod: &"<vonalkod>#{&1}</vonalkod>",
      tomeg: &"<tomeg>#{&1}</tomeg>",
      kulonszolgaltatasok: &"<kulonszolgaltatasok>#{&1}</kulonszolgaltatasok>",
      erteknyilvanitas: &"<erteknyilvanitas>#{&1}</erteknyilvanitas>"
    ]

    """
    <mpl>
    #{StructToXML.run(module, tags)}
    </mpl>
    """
  end
end
