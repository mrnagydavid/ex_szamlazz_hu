defmodule ExSzamlazzHu.CreateInvoice.Waybill do
  @moduledoc false

  alias ExSzamlazzHu.CreateInvoice.Waybill.Transoflex
  alias ExSzamlazzHu.CreateInvoice.Waybill.Sprinter
  alias ExSzamlazzHu.CreateInvoice.Waybill.PPP
  alias ExSzamlazzHu.CreateInvoice.Waybill.MPL
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

  @spec parse(map() | nil) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    __MODULE__
    |> struct(Map.drop(params, [:tof, :ppp, :sprinter, :mpl]))
    |> Map.put(:tof, Transoflex.parse(params[:tof]))
    |> Map.put(:ppp, PPP.parse(params[:ppp]))
    |> Map.put(:sprinter, Sprinter.parse(params[:sprinter]))
    |> Map.put(:mpl, MPL.parse(params[:mpl]))
  end

  def tag(), do: :fuvarlevel

  def attrs(), do: nil

  def content(_) do
    [
      :uticel,
      :futarSzolgalat,
      :vonalkod,
      :megjegyzes,
      :tof,
      :ppp,
      :sprinter,
      :mpl
    ]
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    StructToXML.convert(module)
  end
end
