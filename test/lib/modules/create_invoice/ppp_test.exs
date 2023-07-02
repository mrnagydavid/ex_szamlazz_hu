defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.PPPTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.PPP
  alias ExSzamlazzHu.Factories.PPPFactory

  describe "parse/1" do
    test "should parse a valid waybill for PPP" do
      assert PPP.parse(params()) == %PPP{
               barcode_prefix: "barcode_prefix",
               barcode_postfix: "barcode_postfix"
             }
    end

    test "should parse an empty waybill for PPP" do
      assert PPP.parse(nil) == nil
    end
  end

  describe "validate/1" do
    test "should validate a valid waybill for PPP" do
      struct = PPP.parse(params())

      assert PPP.validate(struct) == :ok
    end

    test "should validate an invalid waybill for PPP" do
      assert PPP.validate(%{
               barcode_prefix: 0,
               barcode_postfix: 0
             }) ==
               {:error,
                %{
                  barcode_prefix: :invalid,
                  barcode_postfix: :invalid
                }}
    end
  end

  def params() do
    PPPFactory.get_params(%{nope: "nope"})
  end
end
