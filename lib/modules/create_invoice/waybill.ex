defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill do
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.Transoflex
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.Sprinter
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.PPP
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.MPL
  alias ExSzamlazzHu.Utils.StructToXML

  @type t :: %__MODULE__{}

  defstruct [
    :uticel,
    :futarSzolgalat,
    :vonalkod,
    :megjegyzes,
    :tof,
    :ppp,
    :sprinter,
    :mpl
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    __MODULE__
    |> struct(Map.drop(params, [:tof, :ppp, :sprinter, :mpl]))
    |> Map.put(:tof, Transoflex.parse(params[:tof]))
    |> Map.put(:ppp, PPP.parse(params[:ppp]))
    |> Map.put(:sprinter, Sprinter.parse(params[:sprinter]))
    |> Map.put(:mpl, MPL.parse(params[:mpl]))
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    tags = [
      uticel: &"<uticel>#{&1}</uticel>",
      futarSzolgalat: &"<futarSzolgalat>#{&1}</futarSzolgalat>",
      vonalkod: &"<vonalkod>#{&1}</vonalkod>",
      megjegyzes: &"<megjegyzes>#{&1}</megjegyzes>",
      tof: &Transoflex.to_xml(&1),
      ppp: &PPP.to_xml(&1),
      sprinter: &Sprinter.to_xml(&1),
      mpl: &MPL.to_xml(&1)
    ]

    """
    <fuvarlevel>
    #{StructToXML.run(module, tags)}
    </fuvarlevel>
    """
  end
end
