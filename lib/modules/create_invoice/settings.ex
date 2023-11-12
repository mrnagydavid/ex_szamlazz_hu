defmodule ExSzamlazzHu.Modules.CreateInvoice.Settings do
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

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    tags = [
      felhasznalo: &"<felhasznalo>#{&1}</felhasznalo>",
      jelszo: &"<jelszo>#{&1}</jelszo>",
      szamlaagentkulcs: &"<szamlaagentkulcs>#{&1}</szamlaagentkulcs>",
      eszamla: &"<eszamla>#{&1}</eszamla>",
      szamlaLetoltes: &"<szamlaLetoltes>#{&1}</szamlaLetoltes>",
      szamlaLetoltesPld: &"<szamlaLetoltesPld>#{&1}</szamlaLetoltesPld>",
      valaszVerzio: &"<valaszVerzio>#{&1}</valaszVerzio>",
      aggregator: &"<aggregator>#{&1}</aggregator>",
      guardian: &"<guardian>#{&1}</guardian>",
      cikkazoninvoice: &"<cikkazoninvoice>#{&1}</cikkazoninvoice>",
      szamlaKulsoAzon: &"<szamlaKulsoAzon>#{&1}</szamlaKulsoAzon>"
    ]

    """
    <beallitasok>
    #{StructToXML.run(module, tags)}
    </beallitasok>
    """
  end
end
