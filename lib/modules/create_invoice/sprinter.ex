defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.Sprinter do
  @type t :: %__MODULE__{}

  defstruct [
    :azonosito,
    :feladokod,
    :iranykod,
    :csomagszam,
    :vonalkodPostfix,
    :szallitasiIdo
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      azonosito: params[:azonosito],
      feladokod: params[:feladokod],
      iranykod: params[:iranykod],
      csomagszam: params[:csomagszam],
      vonalkodPostfix: params[:vonalkodPostfix],
      szallitasiIdo: params[:szallitasiIdo]
    }
  end
end
