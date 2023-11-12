defmodule ExSzamlazzHu.Modules.CreateInvoice.Items.Item.ItemLedger do
  alias ExSzamlazzHu.Utils.StructToXML

  @type t :: %__MODULE__{}

  defstruct [
    :gazdasagiEsem,
    :gazdasagiEsemAfa,
    :arbevetelFokonyviSzam,
    :afaFokonyviSzam,
    :elszDatumTol,
    :elszDatumIg
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    struct(__MODULE__, params)
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    tags = [
      gazdasagiEsem: &"<gazdasagiEsem>#{&1}</gazdasagiEsem>",
      gazdasagiEsemAfa: &"<gazdasagiEsemAfa>#{&1}</gazdasagiEsemAfa>",
      arbevetelFokonyviSzam: &"<arbevetelFokonyviSzam>#{&1}</arbevetelFokonyviSzam>",
      afaFokonyviSzam: &"<afaFokonyviSzam>#{&1}</afaFokonyviSzam>",
      elszDatumTol: &"<elszDatumTol>#{&1}</elszDatumTol>",
      elszDatumIg: &"<elszDatumIg>#{&1}</elszDatumIg>"
    ]

    """
    <tetelFokonyv>
    #{StructToXML.run(module, tags)}
    </tetelFokonyv>
    """
  end
end
