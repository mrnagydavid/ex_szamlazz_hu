defmodule ExSzamlazzHu.Modules.CreateInvoice.ItemLedgerTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.ItemLedger
  alias ExSzamlazzHu.Factories.ItemLedgerFactory

  describe "parse/1" do
    test "should parse a valid ItemLedger" do
      assert ItemLedger.parse(params()) == %ItemLedger{
               economic_event: "economic_event",
               economic_event_vat: "economic_event_vat",
               income_ledger_number: "income_ledger_number",
               settlement_date_from: "settlement_date_from",
               settlement_date_to: "settlement_date_to"
             }
    end

    test "should parse an empty ItemLedger" do
      assert ItemLedger.parse(nil) == nil
    end
  end

  def params() do
    ItemLedgerFactory.get_params(%{nope: "nope"})
  end
end
