defmodule ExSzamlazzHu.Modules.CreateInvoice.CustomerTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Customer
  alias ExSzamlazzHu.Factories.CustomerFactory
  alias ExSzamlazzHu.Factories.CustomerLedgerFactory

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

  describe "to_xml/1" do
    test "should return a valid XML" do
      assert %{vevoFokonyv: CustomerLedgerFactory.get_params()}
             |> params()
             |> Customer.parse()
             |> Customer.to_xml() ==
               """
               <vevo>
               <nev>name</nev>
               <orszag>country</orszag>
               <irsz>zip_code</irsz>
               <telepules>city</telepules>
               <cim>address</cim>
               <email>email</email>
               <sendEmail>false</sendEmail>
               <adoalany>123</adoalany>
               <adoszam>tax_identifier</adoszam>
               <csoportazonosito>group_identifier</csoportazonosito>
               <adoszamEU>eu_tax_identifier</adoszamEU>
               <postazasiNev>mailing_name</postazasiNev>
               <postazasiOrszag>mailing_country</postazasiOrszag>
               <postazasiIrsz>mailing_zip</postazasiIrsz>
               <postazasiTelepules>mailing_city</postazasiTelepules>
               <postazasiCim>mailing_address</postazasiCim>
               <vevoFokonyv>
               <konyvelesDatum>accounting_date</konyvelesDatum>
               <vevoAzonosito>customer_identifier</vevoAzonosito>
               <vevoFokonyviSzam>ledger_number</vevoFokonyviSzam>
               <folyamatosTelj>continuous_delivery</folyamatosTelj>
               <elszDatumTol>settlement_date_from</elszDatumTol>
               <elszDatumIg>settlement_date_to</elszDatumIg>
               </vevoFokonyv>
               <azonosito>identifier</azonosito>
               <alairoNeve>name_of_signatory</alairoNeve>
               <telefonszam>phone_number</telefonszam>
               <megjegyzes>comment</megjegyzes>
               </vevo>
               """
    end
  end

  def params(params \\ %{nope: "nope"}) do
    CustomerFactory.get_params(params)
  end
end
