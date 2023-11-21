defmodule ExSzamlazzHu.CreateInvoice.Items.Item.ItemLedger do
  @moduledoc false

  alias ExSzamlazzHu.Utils.StructToXML

  @type t :: %__MODULE__{}

  defstruct [
    :gazdasagiEsem,
    :gazdasagiEsemAfa,
    :arbevetelFokonyviSzam,
    :afaFokonyviSzam,
    :elszDatumTol,
    :elszDatumIg
  ]

  @spec parse(map() | nil) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    struct(__MODULE__, params)
  end

  def tag(), do: :tetelFokonyv

  def attrs(), do: nil

  def content(_) do
    [
      :gazdasagiEsem,
      :gazdasagiEsemAfa,
      :arbevetelFokonyviSzam,
      :afaFokonyviSzam,
      :elszDatumTol,
      :elszDatumIg
    ]
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    StructToXML.convert(module)
  end
end
