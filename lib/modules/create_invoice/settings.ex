defmodule ExSzamlazzHu.CreateInvoice.Settings do
  @moduledoc false

  alias ExSzamlazzHu.Utils.StructToXML

  @type t :: %__MODULE__{}

  @enforce_keys [:eszamla, :szamlaLetoltes]
  defstruct felhasznalo: nil,
            jelszo: nil,
            szamlaagentkulcs: nil,
            eszamla: nil,
            szamlaLetoltes: nil,
            szamlaLetoltesPld: nil,
            valaszVerzio: 1,
            aggregator: nil,
            guardian: nil,
            cikkazoninvoice: nil,
            szamlaKulsoAzon: nil

  @spec parse(map()) :: t()
  def parse(nil), do: nil

  def parse(params) do
    struct(__MODULE__, params)
  end

  def tag(), do: :beallitasok

  def attrs(), do: nil

  def content() do
    [
      :felhasznalo,
      :jelszo,
      :szamlaagentkulcs,
      :eszamla,
      :szamlaLetoltes,
      :szamlaLetoltesPld,
      :valaszVerzio,
      :aggregator,
      :guardian,
      :cikkazoninvoice,
      :szamlaKulsoAzon
    ]
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    StructToXML.convert(module)
  end
end
