defmodule ExSzamlazzHu.CreateInvoice.HeaderTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.CreateInvoice.Header
  alias ExSzamlazzHu.Factories.HeaderFactory

  describe "parse/1" do
    test "should parse a valid Header" do
      assert Header.parse(params()) == %Header{
               keltDatum: "1997-08-29",
               teljesitesDatum: "1997-08-29",
               fizetesiHataridoDatum: "1997-08-29",
               fizmod: "payment_method",
               penznem: "HUF",
               szamlaNyelve: "en",
               megjegyzes: "comment",
               arfolyamBank: "exchange_rate_bank",
               arfolyam: "123.4",
               rendelesSzam: "order_identifier",
               dijbekeroSzamlaszam: "fee_request_identifier",
               elolegszamla: false,
               vegszamla: true,
               elolegSzamlaszam: nil,
               helyesbitoszamla: false,
               helyesbitettSzamlaszam: nil,
               dijbekero: false,
               szallitolevel: false,
               logoExtra: "logo_extra",
               szamlaszamElotag: "PRFX",
               fizetendoKorrekcio: "123.4",
               fizetve: true,
               arresAfa: false,
               eusAfa: false,
               szamlaSablon: "invoice_draft",
               elonezetpdf: false
             }
    end

    test "should parse an empty Header" do
      assert Header.parse(nil) == nil
    end
  end

  describe "to_xml/1" do
    test "should return a valid XML" do
      assert %{
               elolegSzamlaszam: "proforma_invoice_identifier",
               helyesbitettSzamlaszam: "corrected_invoice_identifier"
             }
             |> params()
             |> Header.parse()
             |> Header.to_xml() ==
               """
               <fejlec>
               <keltDatum>1997-08-29</keltDatum>
               <teljesitesDatum>1997-08-29</teljesitesDatum>
               <fizetesiHataridoDatum>1997-08-29</fizetesiHataridoDatum>
               <fizmod>payment_method</fizmod>
               <penznem>HUF</penznem>
               <szamlaNyelve>en</szamlaNyelve>
               <megjegyzes>comment</megjegyzes>
               <arfolyamBank>exchange_rate_bank</arfolyamBank>
               <arfolyam>123.4</arfolyam>
               <rendelesSzam>order_identifier</rendelesSzam>
               <dijbekeroSzamlaszam>fee_request_identifier</dijbekeroSzamlaszam>
               <elolegszamla>false</elolegszamla>
               <vegszamla>true</vegszamla>
               <elolegSzamlaszam>proforma_invoice_identifier</elolegSzamlaszam>
               <helyesbitoszamla>false</helyesbitoszamla>
               <helyesbitettSzamlaszam>corrected_invoice_identifier</helyesbitettSzamlaszam>
               <dijbekero>false</dijbekero>
               <szallitolevel>false</szallitolevel>
               <logoExtra>logo_extra</logoExtra>
               <szamlaszamElotag>PRFX</szamlaszamElotag>
               <fizetendoKorrekcio>123.4</fizetendoKorrekcio>
               <fizetve>true</fizetve>
               <arresAfa>false</arresAfa>
               <eusAfa>false</eusAfa>
               <szamlaSablon>invoice_draft</szamlaSablon>
               <elonezetpdf>false</elonezetpdf>
               </fejlec>
               """
    end
  end

  def params(params \\ %{nope: "nope"}) do
    HeaderFactory.get_params(params)
  end
end
