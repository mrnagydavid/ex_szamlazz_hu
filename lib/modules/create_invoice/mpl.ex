defmodule ExSzamlazzHu.CreateInvoice.Waybill.MPL do
  @moduledoc false

  alias ExSzamlazzHu.Utils.StructToXML

  @type t :: %__MODULE__{}

  defstruct [
    :vevokod,
    :vonalkod,
    :tomeg,
    :kulonszolgaltatasok,
    :erteknyilvanitas
  ]

  @spec parse(map() | nil) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    struct(__MODULE__, params)
  end

  def tag(), do: :mpl

  def attrs(), do: nil

  def content() do
    [
      :vevokod,
      :vonalkod,
      :tomeg,
      :kulonszolgaltatasok,
      :erteknyilvanitas
    ]
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    StructToXML.convert(module)
  end
end
