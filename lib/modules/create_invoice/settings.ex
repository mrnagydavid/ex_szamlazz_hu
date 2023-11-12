defmodule ExSzamlazzHu.Modules.CreateInvoice.Settings do
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
    %__MODULE__{
      felhasznalo: params[:felhasznalo],
      jelszo: params[:jelszo],
      szamlaagentkulcs: params[:szamlaagentkulcs],
      eszamla: params[:eszamla],
      szamlaLetoltes: params[:szamlaLetoltes],
      szamlaLetoltesPld: params[:szamlaLetoltesPld],
      valaszVerzio: params[:valaszVerzio],
      aggregator: params[:aggregator],
      guardian: params[:guardian],
      cikkazoninvoice: params[:cikkazoninvoice],
      szamlaKulsoAzon: params[:szamlaKulsoAzon]
    }
  end
end
