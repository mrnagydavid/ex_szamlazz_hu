defmodule ExSzamlazzHu.Modules.CreateInvoice.ItemLedger do
  @type t :: %__MODULE__{}

  defstruct [
    :gazdasagiEsem,
    :gazdasagiEsemAfa,
    :arbevetelFokonyviSzam,
    :afaFokonyviSzam,
    :elszDatumTol,
    :elszDatumIg
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      gazdasagiEsem: params[:gazdasagiEsem],
      gazdasagiEsemAfa: params[:gazdasagiEsemAfa],
      arbevetelFokonyviSzam: params[:arbevetelFokonyviSzam],
      afaFokonyviSzam: params[:afaFokonyviSzam],
      elszDatumTol: params[:elszDatumTol],
      elszDatumIg: params[:elszDatumIg]
    }
  end
end
