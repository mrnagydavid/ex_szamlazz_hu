defmodule ExSzamlazzHu.Modules.CreateInvoice.Customer do
  alias ExSzamlazzHu.Modules.CreateInvoice.CustomerLedger

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
    %__MODULE__{
      nev: params[:nev],
      orszag: params[:orszag],
      irsz: params[:irsz],
      telepules: params[:telepules],
      cim: params[:cim],
      email: params[:email],
      sendEmail: params[:sendEmail],
      adoalany: params[:adoalany],
      adoszam: params[:adoszam],
      csoportazonosito: params[:csoportazonosito],
      adoszamEU: params[:adoszamEU],
      postazasiNev: params[:postazasiNev],
      postazasiOrszag: params[:postazasiOrszag],
      postazasiIrsz: params[:postazasiIrsz],
      postazasiTelepules: params[:postazasiTelepules],
      postazasiCim: params[:postazasiCim],
      vevoFokonyv: CustomerLedger.parse(params[:vevoFokonyv]),
      azonosito: params[:azonosito],
      alairoNeve: params[:alairoNeve],
      telefonszam: params[:telefonszam],
      megjegyzes: params[:megjegyzes]
    }
  end
end
