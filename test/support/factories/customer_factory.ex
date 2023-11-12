defmodule ExSzamlazzHu.Factories.CustomerFactory do
  @moduledoc false

  alias ExSzamlazzHu.Factories.CustomerLedgerFactory

  def get_params(params \\ %{}) do
    %{
      nev: "name",
      orszag: "country",
      irsz: "zip_code",
      telepules: "city",
      cim: "address",
      email: "email",
      sendEmail: false,
      adoalany: 123,
      adoszam: "tax_identifier",
      csoportazonosito: "group_identifier",
      adoszamEU: "eu_tax_identifier",
      postazasiNev: "mailing_name",
      postazasiOrszag: "mailing_country",
      postazasiIrsz: "mailing_zip",
      postazasiTelepules: "mailing_city",
      postazasiCim: "mailing_address",
      vevoFokonyv: nil,
      azonosito: "identifier",
      alairoNeve: "name_of_signatory",
      telefonszam: "phone_number",
      megjegyzes: "comment"
    }
    |> Map.merge(params)
    |> maybe_add_customer_ledger()
  end

  defp maybe_add_customer_ledger(%{vevoFokonyv: nil} = params), do: params

  defp maybe_add_customer_ledger(params) do
    Map.put(params, :vevoFokonyv, CustomerLedgerFactory.get_params(params[:vevoFokonyv]))
  end
end
