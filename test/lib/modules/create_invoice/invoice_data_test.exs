defmodule ExSzamlazzHu.CreateInvoice.InvoiceDataTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.CreateInvoice.InvoiceData
  alias ExSzamlazzHu.CreateInvoice.Settings
  alias ExSzamlazzHu.CreateInvoice.Header
  alias ExSzamlazzHu.CreateInvoice.Customer
  alias ExSzamlazzHu.CreateInvoice.Seller
  alias ExSzamlazzHu.CreateInvoice.Waybill
  alias ExSzamlazzHu.CreateInvoice.Waybill.MPL
  alias ExSzamlazzHu.CreateInvoice.Items.Item
  alias ExSzamlazzHu.Factories.InvoiceDataFactory
  alias ExSzamlazzHu.Factories.HeaderFactory
  alias ExSzamlazzHu.Factories.WaybillFactory
  alias ExSzamlazzHu.Factories.CustomerFactory
  alias ExSzamlazzHu.Factories.CustomerLedgerFactory
  alias ExSzamlazzHu.Factories.ItemFactory
  alias ExSzamlazzHu.Factories.ItemLedgerFactory

  describe "parse/1" do
    test "should parse a valid InvoiceData" do
      assert %{fuvarlevel: WaybillFactory.get_params(%{mpl: %{}})}
             |> params()
             |> InvoiceData.parse() ==
               %InvoiceData{
                 beallitasok: %Settings{
                   felhasznalo: "user",
                   jelszo: "password",
                   szamlaagentkulcs: "agent_key",
                   eszamla: true,
                   szamlaLetoltes: false,
                   szamlaLetoltesPld: 0,
                   valaszVerzio: 1,
                   aggregator: "aggregator",
                   guardian: false,
                   cikkazoninvoice: false,
                   szamlaKulsoAzon: "external_invoice_identifier"
                 },
                 fejlec: %Header{
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
                 },
                 vevo: %Customer{
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
                 },
                 elado: %Seller{
                   bank: "bank",
                   bankszamlaszam: "bank_account_number",
                   emailReplyto: "email_reply_to",
                   emailTargy: "email_subject",
                   emailSzoveg: "email_text",
                   alairoNeve: "name_of_signatory"
                 },
                 fuvarlevel: %Waybill{
                   uticel: "destination",
                   futarSzolgalat: "three_pl_provider",
                   vonalkod: "barcode",
                   megjegyzes: "comment",
                   tof: nil,
                   ppp: nil,
                   sprinter: nil,
                   mpl: %MPL{
                     vevokod: "buyer_identifier",
                     vonalkod: "barcode",
                     tomeg: "weight",
                     kulonszolgaltatasok: "extra_services",
                     erteknyilvanitas: "value_statement"
                   }
                 },
                 tetelek: [
                   %Item{
                     megnevezes: "name",
                     azonosito: "identifier",
                     mennyiseg: "1.5",
                     mennyisegiEgyseg: "unit",
                     nettoEgysegar: "net_unit_price",
                     afakulcs: "27",
                     arresAfaAlap: "margin_vat_base",
                     nettoErtek: "100",
                     afaErtek: "27",
                     bruttoErtek: "127",
                     megjegyzes: "comment",
                     tetelFokonyv: nil
                   }
                 ]
               }
    end
  end

  describe "to_xml/1" do
    test "should return a valid XML" do
      assert %{
               fejlec:
                 HeaderFactory.get_params(%{
                   elolegSzamlaszam: "proforma_invoice_identifier",
                   helyesbitettSzamlaszam: "corrected_invoice_identifier"
                 }),
               vevo: CustomerFactory.get_params(%{vevoFokonyv: CustomerLedgerFactory.get_params()}),
               fuvarlevel: WaybillFactory.get_params(%{mpl: %{}}),
               tetelek: [
                 ItemFactory.get_params(%{
                   tetelFokonyv: ItemLedgerFactory.get_params()
                 })
               ]
             }
             |> params()
             |> InvoiceData.parse()
             |> InvoiceData.to_xml() ==
               """
               <?xml version="1.0" encoding="UTF-8"?>
               <xmlszamla xmlns="http://www.szamlazz.hu/xmlszamla" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.szamlazz.hu/xmlszamla https://www.szamlazz.hu/szamla/docs/xsds/agent/xmlszamla.xsd">
                 <beallitasok>
                   <felhasznalo>user</felhasznalo>
                   <jelszo>password</jelszo>
                   <szamlaagentkulcs>agent_key</szamlaagentkulcs>
                   <eszamla>true</eszamla>
                   <szamlaLetoltes>false</szamlaLetoltes>
                   <szamlaLetoltesPld>0</szamlaLetoltesPld>
                   <valaszVerzio>1</valaszVerzio>
                   <aggregator>aggregator</aggregator>
                   <guardian>false</guardian>
                   <cikkazoninvoice>false</cikkazoninvoice>
                   <szamlaKulsoAzon>external_invoice_identifier</szamlaKulsoAzon>
                 </beallitasok>
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
                 <elado>
                   <bank>bank</bank>
                   <bankszamlaszam>bank_account_number</bankszamlaszam>
                   <emailReplyto>email_reply_to</emailReplyto>
                   <emailTargy>email_subject</emailTargy>
                   <emailSzoveg>email_text</emailSzoveg>
                   <alairoNeve>name_of_signatory</alairoNeve>
                 </elado>
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
                 <fuvarlevel>
                   <uticel>destination</uticel>
                   <futarSzolgalat>three_pl_provider</futarSzolgalat>
                   <vonalkod>barcode</vonalkod>
                   <megjegyzes>comment</megjegyzes>
                   <mpl>
                     <vevokod>buyer_identifier</vevokod>
                     <vonalkod>barcode</vonalkod>
                     <tomeg>weight</tomeg>
                     <kulonszolgaltatasok>extra_services</kulonszolgaltatasok>
                     <erteknyilvanitas>value_statement</erteknyilvanitas>
                   </mpl>
                 </fuvarlevel>
                 <tetelek>
                   <tetel>
                     <megnevezes>name</megnevezes>
                     <azonosito>identifier</azonosito>
                     <mennyiseg>1.5</mennyiseg>
                     <mennyisegiEgyseg>unit</mennyisegiEgyseg>
                     <nettoEgysegar>net_unit_price</nettoEgysegar>
                     <afakulcs>27</afakulcs>
                     <arresAfaAlap>margin_vat_base</arresAfaAlap>
                     <nettoErtek>100</nettoErtek>
                     <afaErtek>27</afaErtek>
                     <bruttoErtek>127</bruttoErtek>
                     <megjegyzes>comment</megjegyzes>
                     <tetelFokonyv>
                       <gazdasagiEsem>economic_event</gazdasagiEsem>
                       <gazdasagiEsemAfa>economic_event_vat</gazdasagiEsemAfa>
                       <arbevetelFokonyviSzam>income_ledger_number</arbevetelFokonyviSzam>
                       <afaFokonyviSzam>vat_ledger_number</afaFokonyviSzam>
                       <elszDatumTol>settlement_date_from</elszDatumTol>
                       <elszDatumIg>settlement_date_to</elszDatumIg>
                     </tetelFokonyv>
                   </tetel>
                 </tetelek>
               </xmlszamla>
               """
    end
  end

  def params(params \\ %{nope: "nope"}) do
    InvoiceDataFactory.get_params(params)
  end
end
