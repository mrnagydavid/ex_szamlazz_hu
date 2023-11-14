defmodule ExSzamlazzHu.CreateInvoice.CustomerLedgerTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.CreateInvoice.CustomerLedger
  alias ExSzamlazzHu.Factories.CustomerLedgerFactory

  describe "parse/1" do
    test "should parse a valid CustomerLedger" do
      assert CustomerLedger.parse(params()) == %CustomerLedger{
               konyvelesDatum: "accounting_date",
               vevoAzonosito: "customer_identifier",
               vevoFokonyviSzam: "ledger_number",
               folyamatosTelj: "continuous_delivery",
               elszDatumTol: "settlement_date_from",
               elszDatumIg: "settlement_date_to"
             }
    end

    test "should parse an empty CustomerLedger" do
      assert CustomerLedger.parse(nil) == nil
    end
  end

  describe "to_xml/1" do
    test "should return a valid XML" do
      assert params()
             |> CustomerLedger.parse()
             |> CustomerLedger.to_xml() ==
               """
               <vevoFokonyv>
               <konyvelesDatum>accounting_date</konyvelesDatum>
               <vevoAzonosito>customer_identifier</vevoAzonosito>
               <vevoFokonyviSzam>ledger_number</vevoFokonyviSzam>
               <folyamatosTelj>continuous_delivery</folyamatosTelj>
               <elszDatumTol>settlement_date_from</elszDatumTol>
               <elszDatumIg>settlement_date_to</elszDatumIg>
               </vevoFokonyv>
               """
    end
  end

  def params() do
    CustomerLedgerFactory.get_params(%{nope: "nope"})
  end
end
