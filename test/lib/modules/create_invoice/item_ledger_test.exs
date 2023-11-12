defmodule ExSzamlazzHu.Modules.CreateInvoice.ItemLedgerTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Items.Item.ItemLedger
  alias ExSzamlazzHu.Factories.ItemLedgerFactory

  describe "parse/1" do
    test "should parse a valid ItemLedger" do
      assert ItemLedger.parse(params()) == %ItemLedger{
               gazdasagiEsem: "economic_event",
               gazdasagiEsemAfa: "economic_event_vat",
               arbevetelFokonyviSzam: "income_ledger_number",
               afaFokonyviSzam: "vat_ledger_number",
               elszDatumTol: "settlement_date_from",
               elszDatumIg: "settlement_date_to"
             }
    end

    test "should parse an empty ItemLedger" do
      assert ItemLedger.parse(nil) == nil
    end
  end

  describe "to_xml/1" do
    test "should return a valid XML" do
      assert params()
             |> ItemLedger.parse()
             |> ItemLedger.to_xml() ==
               """
               <tetelFokonyv>
               <gazdasagiEsem>economic_event</gazdasagiEsem>
               <gazdasagiEsemAfa>economic_event_vat</gazdasagiEsemAfa>
               <arbevetelFokonyviSzam>income_ledger_number</arbevetelFokonyviSzam>
               <afaFokonyviSzam>vat_ledger_number</afaFokonyviSzam>
               <elszDatumTol>settlement_date_from</elszDatumTol>
               <elszDatumIg>settlement_date_to</elszDatumIg>
               </tetelFokonyv>
               """
    end
  end

  def params() do
    ItemLedgerFactory.get_params(%{nope: "nope"})
  end
end
