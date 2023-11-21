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

  def tag(), do: :sprinter

  def attrs(), do: nil

  def content(_) do
    [
      :azonosito,
      :feladokod,
      :iranykod,
      :csomagszam,
      :vonalkodPostfix,
      :szallitasiIdo
    ]
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    StructToXML.convert(module)
  end
end
