defmodule ExSzamlazzHu.Modules.CreateInvoice.BuyerLedgerTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.BuyerLedger
  alias ExSzamlazzHu.Factories.BuyerLedgerFactory

  describe "parse/1" do
    test "should parse a valid BuyerLedger" do
      assert BuyerLedger.parse(params()) == %BuyerLedger{
               accounting_date: "accounting_date",
               customer_identifier: "customer_identifier",
               ledger_number: "ledger_number",
               continuous_delivery: "continuous_delivery",
               settlement_date_from: "settlement_date_from",
               settlement_date_to: "settlement_date_to"
             }
    end

    test "should parse an empty BuyerLedger" do
      assert BuyerLedger.parse(nil) == nil
    end
  end

  def params() do
    BuyerLedgerFactory.get_params(%{nope: "nope"})
  end
end
