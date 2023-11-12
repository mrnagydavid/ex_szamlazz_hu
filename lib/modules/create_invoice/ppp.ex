defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.PPP do
  @moduledoc false

  alias ExSzamlazzHu.Utils.StructToXML

  @type t :: %__MODULE__{}

  defstruct [
    :vonalkodPrefix,
    :vonalkodPostfix
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    struct(__MODULE__, params)
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    tags = [
      vonalkodPrefix: &"<vonalkodPrefix>#{&1}</vonalkodPrefix>",
      vonalkodPostfix: &"<vonalkodPostfix>#{&1}</vonalkodPostfix>"
    ]

    """
    <ppp>
    #{StructToXML.run(module, tags)}
    </ppp>
    """
  end
end
