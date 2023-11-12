defmodule ExSzamlazzHu.Modules.CreateInvoice.Header do
  @moduledoc false

  alias ExSzamlazzHu.Utils.StructToXML

  @type t :: %__MODULE__{}

  @enforce_keys [
    :teljesitesDatum,
    :fizetesiHataridoDatum,
    :fizmod,
    :penznem,
    :szamlaNyelve
  ]
  defstruct [
    :keltDatum,
    :teljesitesDatum,
    :fizetesiHataridoDatum,
    :fizmod,
    :penznem,
    :szamlaNyelve,
    :megjegyzes,
    :arfolyamBank,
    :arfolyam,
    :rendelesSzam,
    :dijbekeroSzamlaszam,
    :elolegszamla,
    :vegszamla,
    :elolegSzamlaszam,
    :helyesbitoszamla,
    :helyesbitettSzamlaszam,
    :dijbekero,
    :szallitolevel,
    :logoExtra,
    :szamlaszamElotag,
    :fizetendoKorrekcio,
    :fizetve,
    :arresAfa,
    :eusAfa,
    :szamlaSablon,
    :elonezetpdf
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    struct(__MODULE__, params)
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    tags = [
      keltDatum: &"<keltDatum>#{&1}</keltDatum>",
      teljesitesDatum: &"<teljesitesDatum>#{&1}</teljesitesDatum>",
      fizetesiHataridoDatum: &"<fizetesiHataridoDatum>#{&1}</fizetesiHataridoDatum>",
      fizmod: &"<fizmod>#{&1}</fizmod>",
      penznem: &"<penznem>#{&1}</penznem>",
      szamlaNyelve: &"<szamlaNyelve>#{&1}</szamlaNyelve>",
      megjegyzes: &"<megjegyzes>#{&1}</megjegyzes>",
      arfolyamBank: &"<arfolyamBank>#{&1}</arfolyamBank>",
      arfolyam: &"<arfolyam>#{&1}</arfolyam>",
      rendelesSzam: &"<rendelesSzam>#{&1}</rendelesSzam>",
      dijbekeroSzamlaszam: &"<dijbekeroSzamlaszam>#{&1}</dijbekeroSzamlaszam>",
      elolegszamla: &"<elolegszamla>#{&1}</elolegszamla>",
      vegszamla: &"<vegszamla>#{&1}</vegszamla>",
      elolegSzamlaszam: &"<elolegSzamlaszam>#{&1}</elolegSzamlaszam>",
      helyesbitoszamla: &"<helyesbitoszamla>#{&1}</helyesbitoszamla>",
      helyesbitettSzamlaszam: &"<helyesbitettSzamlaszam>#{&1}</helyesbitettSzamlaszam>",
      dijbekero: &"<dijbekero>#{&1}</dijbekero>",
      szallitolevel: &"<szallitolevel>#{&1}</szallitolevel>",
      logoExtra: &"<logoExtra>#{&1}</logoExtra>",
      szamlaszamElotag: &"<szamlaszamElotag>#{&1}</szamlaszamElotag>",
      fizetendoKorrekcio: &"<fizetendoKorrekcio>#{&1}</fizetendoKorrekcio>",
      fizetve: &"<fizetve>#{&1}</fizetve>",
      arresAfa: &"<arresAfa>#{&1}</arresAfa>",
      eusAfa: &"<eusAfa>#{&1}</eusAfa>",
      szamlaSablon: &"<szamlaSablon>#{&1}</szamlaSablon>",
      elonezetpdf: &"<elonezetpdf>#{&1}</elonezetpdf>"
    ]

    """
    <fejlec>
    #{StructToXML.run(module, tags)}
    </fejlec>
    """
  end
end
