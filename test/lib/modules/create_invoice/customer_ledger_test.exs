defmodule ExSzamlazzHu.Modules.CreateInvoice.CustomerLedgerTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.CustomerLedger
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

  def params() do
    CustomerLedgerFactory.get_params(%{nope: "nope"})
  end
end
