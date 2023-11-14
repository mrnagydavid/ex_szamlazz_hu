defmodule ExSzamlazzHu.CreateInvoice.Waybill.Sprinter do
  @moduledoc false

  alias ExSzamlazzHu.Utils.StructToXML

  @type t :: %__MODULE__{}

  defstruct [
    :azonosito,
    :feladokod,
    :iranykod,
    :csomagszam,
    :vonalkodPostfix,
    :szallitasiIdo
  ]

  @spec parse(map() | nil) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    struct(__MODULE__, params)
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    tags = [
      azonosito: &"<azonosito>#{&1}</azonosito>",
      feladokod: &"<feladokod>#{&1}</feladokod>",
      iranykod: &"<iranykod>#{&1}</iranykod>",
      csomagszam: &"<csomagszam>#{&1}</csomagszam>",
      vonalkodPostfix: &"<vonalkodPostfix>#{&1}</vonalkodPostfix>",
      szallitasiIdo: &"<szallitasiIdo>#{&1}</szallitasiIdo>"
    ]

    """
    <sprinter>
    #{StructToXML.run(module, tags)}
    </sprinter>
    """
  end
end
