defmodule ExSzamlazzHu.Modules.CreateInvoice.CustomerTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Customer
  alias ExSzamlazzHu.Factories.CustomerFactory

  describe "parse/1" do
    test "should parse a valid Customer" do
      assert Customer.parse(params()) == %Customer{
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
    end

    test "should parse an empty Customer" do
      assert Customer.parse(nil) == nil
    end
  end

  def params() do
    CustomerFactory.get_params(%{nope: "nope"})
  end
end
