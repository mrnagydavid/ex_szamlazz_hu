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

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    __MODULE__
    |> struct(Map.drop(params, [:vevoFokonyv]))
    |> Map.put(:vevoFokonyv, CustomerLedger.parse(params[:vevoFokonyv]))
  end

  @spec to_xml(t()) :: String.t()
  def to_xml(%__MODULE__{} = module) do
    tags = [
      nev: &"<nev>#{&1}</nev>",
      orszag: &"<orszag>#{&1}</orszag>",
      irsz: &"<irsz>#{&1}</irsz>",
      telepules: &"<telepules>#{&1}</telepules>",
      cim: &"<cim>#{&1}</cim>",
      email: &"<email>#{&1}</email>",
      sendEmail: &"<sendEmail>#{&1}</sendEmail>",
      adoalany: &"<adoalany>#{&1}</adoalany>",
      adoszam: &"<adoszam>#{&1}</adoszam>",
      csoportazonosito: &"<csoportazonosito>#{&1}</csoportazonosito>",
      adoszamEU: &"<adoszamEU>#{&1}</adoszamEU>",
      postazasiNev: &"<postazasiNev>#{&1}</postazasiNev>",
      postazasiOrszag: &"<postazasiOrszag>#{&1}</postazasiOrszag>",
      postazasiIrsz: &"<postazasiIrsz>#{&1}</postazasiIrsz>",
      postazasiTelepules: &"<postazasiTelepules>#{&1}</postazasiTelepules>",
      postazasiCim: &"<postazasiCim>#{&1}</postazasiCim>",
      vevoFokonyv: &CustomerLedger.to_xml(&1),
      azonosito: &"<azonosito>#{&1}</azonosito>",
      alairoNeve: &"<alairoNeve>#{&1}</alairoNeve>",
      telefonszam: &"<telefonszam>#{&1}</telefonszam>",
      megjegyzes: &"<megjegyzes>#{&1}</megjegyzes>"
    ]

    """
    <vevo>
    #{StructToXML.run(module, tags)}
    </vevo>
    """
  end
end
