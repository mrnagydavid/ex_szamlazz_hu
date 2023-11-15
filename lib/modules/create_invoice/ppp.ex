defmodule ExSzamlazzHu.CreateInvoice.Waybill.PPP do
  @moduledoc false

  alias ExSzamlazzHu.Utils.StructToXML

  @type t :: %__MODULE__{}

  defstruct [
    :vonalkodPrefix,
    :vonalkodPostfix
  ]

  @spec parse(map() | nil) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    struct(__MODULE__, params)
  end

  def tag(), do: :ppp

  def attrs(), do: nil

  def content() do
    [
      :vonalkodPrefix,
      :vonalkodPostfix
    ]
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    StructToXML.convert(module)
  end
end
