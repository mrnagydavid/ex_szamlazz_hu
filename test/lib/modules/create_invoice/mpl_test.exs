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

  describe "validate/1" do
    test "should validate a valid waybill for MPL" do
      struct = MPL.parse(params())

      assert MPL.validate(struct) == :ok
    end

    test "should validate an invalid waybill for MPL" do
      assert MPL.validate(%{
               buyer_identifier: 0,
               barcode: 0,
               weight: 0,
               extra_services: 0,
               value_statement: 0
             }) ==
               {:error,
                %{
                  buyer_identifier: :invalid,
                  barcode: :invalid,
                  weight: :invalid,
                  extra_services: :invalid,
                  value_statement: :invalid
                }}
    end
  end

  def params() do
    MPLFactory.get_params(%{nope: "nope"})
  end
end
