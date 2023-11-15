defmodule ExSzamlazzHu.CreateInvoice.Header do
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

  @spec parse(map() | nil) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    struct(__MODULE__, params)
  end

  def tag(), do: :fejlec

  def attrs(), do: nil

  def content() do
    [
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
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    StructToXML.convert(module)
  end
end
