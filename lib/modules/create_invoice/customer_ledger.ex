defmodule ExSzamlazzHu.Modules.CreateInvoice.CustomerLedger do
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
    %__MODULE__{
      konyvelesDatum: params[:konyvelesDatum],
      vevoAzonosito: params[:vevoAzonosito],
      vevoFokonyviSzam: params[:vevoFokonyviSzam],
      folyamatosTelj: params[:folyamatosTelj],
      elszDatumTol: params[:elszDatumTol],
      elszDatumIg: params[:elszDatumIg]
    }
  end
end
