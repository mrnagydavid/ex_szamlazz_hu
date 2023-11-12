defmodule ExSzamlazzHu.Modules.CreateInvoice.Header do
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
    %__MODULE__{
      keltDatum: params[:keltDatum],
      teljesitesDatum: params[:teljesitesDatum],
      fizetesiHataridoDatum: params[:fizetesiHataridoDatum],
      fizmod: params[:fizmod],
      penznem: params[:penznem],
      szamlaNyelve: params[:szamlaNyelve],
      megjegyzes: params[:megjegyzes],
      arfolyamBank: params[:arfolyamBank],
      arfolyam: params[:arfolyam],
      rendelesSzam: params[:rendelesSzam],
      dijbekeroSzamlaszam: params[:dijbekeroSzamlaszam],
      elolegszamla: params[:elolegszamla],
      vegszamla: params[:vegszamla],
      elolegSzamlaszam: params[:elolegSzamlaszam],
      helyesbitoszamla: params[:helyesbitoszamla],
      helyesbitettSzamlaszam: params[:helyesbitettSzamlaszam],
      dijbekero: params[:dijbekero],
      szallitolevel: params[:szallitolevel],
      logoExtra: params[:logoExtra],
      szamlaszamElotag: params[:szamlaszamElotag],
      fizetendoKorrekcio: params[:fizetendoKorrekcio],
      fizetve: params[:fizetve],
      arresAfa: params[:arresAfa],
      eusAfa: params[:eusAfa],
      szamlaSablon: params[:szamlaSablon],
      elonezetpdf: params[:elonezetpdf]
    }
  end
end
