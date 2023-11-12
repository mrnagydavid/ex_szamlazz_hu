defmodule ExSzamlazzHu.Modules.CreateInvoice.CustomerLedger do
  @moduledoc false

  alias ExSzamlazzHu.Utils.StructToXML

  @type t :: %__MODULE__{}

  defstruct [
    :konyvelesDatum,
    :vevoAzonosito,
    :vevoFokonyviSzam,
    :folyamatosTelj,
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
      konyvelesDatum: &"<konyvelesDatum>#{&1}</konyvelesDatum>",
      vevoAzonosito: &"<vevoAzonosito>#{&1}</vevoAzonosito>",
      vevoFokonyviSzam: &"<vevoFokonyviSzam>#{&1}</vevoFokonyviSzam>",
      folyamatosTelj: &"<folyamatosTelj>#{&1}</folyamatosTelj>",
      elszDatumTol: &"<elszDatumTol>#{&1}</elszDatumTol>",
      elszDatumIg: &"<elszDatumIg>#{&1}</elszDatumIg>"
    ]

    """
    <vevoFokonyv>
    #{StructToXML.run(module, tags)}
    </vevoFokonyv>
    """
  end
end
