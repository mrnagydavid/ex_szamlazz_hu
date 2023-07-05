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

  describe "validate/1" do
    test "should validate a valid BuyerLedger" do
      struct = BuyerLedger.parse(params())

      assert BuyerLedger.validate(struct) == :ok
    end

    test "should validate an invalid BuyerLedger" do
      assert BuyerLedger.validate(%{
               accounting_date: 0,
               customer_identifier: 0,
               ledger_number: 0,
               continuous_delivery: 0,
               settlement_date_from: 0,
               settlement_date_to: 0
             }) ==
               {:error,
                %{
                  accounting_date: :invalid,
                  customer_identifier: :invalid,
                  ledger_number: :invalid,
                  continuous_delivery: :invalid,
                  settlement_date_from: :invalid,
                  settlement_date_to: :invalid
                }}
    end
  end

  def params() do
    BuyerLedgerFactory.get_params(%{nope: "nope"})
  end
end
