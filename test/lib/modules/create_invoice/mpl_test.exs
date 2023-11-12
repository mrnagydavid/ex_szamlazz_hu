defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.MPLTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.MPL
  alias ExSzamlazzHu.Factories.MPLFactory

  describe "parse/1" do
    test "should parse a valid waybill for MPL" do
      assert MPL.parse(params()) == %MPL{
               buyer_identifier: "buyer_identifier",
               barcode: "barcode",
               weight: "weight",
               extra_services: "extra_services",
               value_statement: "value_statement"
             }
    end

    test "should parse an empty waybill for MPL" do
      assert MPL.parse(nil) == nil
    end
  end

  def params() do
    MPLFactory.get_params(%{nope: "nope"})
  end
end
