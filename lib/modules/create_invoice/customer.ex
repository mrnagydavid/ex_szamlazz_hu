defmodule ExSzamlazzHu.CreateInvoice.Customer do
  @moduledoc false

  alias ExSzamlazzHu.CreateInvoice.CustomerLedger
  alias ExSzamlazzHu.Utils.StructToXML

  @type t :: %__MODULE__{}

  @enforce_keys [
    :nev,
    :irsz,
    :telepules,
    :cim
  ]
  defstruct [
    :nev,
    :orszag,
    :irsz,
    :telepules,
    :cim,
    :email,
    :sendEmail,
    :adoalany,
    :adoszam,
    :csoportazonosito,
    :adoszamEU,
    :postazasiNev,
    :postazasiOrszag,
    :postazasiIrsz,
    :postazasiTelepules,
    :postazasiCim,
    :vevoFokonyv,
    :azonosito,
    :alairoNeve,
    :telefonszam,
    :megjegyzes
  ]

  @spec parse(map() | nil) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    __MODULE__
    |> struct(Map.drop(params, [:vevoFokonyv]))
    |> Map.put(:vevoFokonyv, CustomerLedger.parse(params[:vevoFokonyv]))
  end

  def tag(), do: :vevo

  def attrs(), do: nil

  def content() do
    [
      :nev,
      :orszag,
      :irsz,
      :telepules,
      :cim,
      :email,
      :sendEmail,
      :adoalany,
      :adoszam,
      :csoportazonosito,
      :adoszamEU,
      :postazasiNev,
      :postazasiOrszag,
      :postazasiIrsz,
      :postazasiTelepules,
      :postazasiCim,
      :vevoFokonyv,
      :azonosito,
      :alairoNeve,
      :telefonszam,
      :megjegyzes
    ]
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    StructToXML.convert(module)
  end
end
