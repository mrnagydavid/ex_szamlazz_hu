defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.SprinterTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.Sprinter
  alias ExSzamlazzHu.Factories.SprinterFactory

  describe "parse/1" do
    test "should parse a valid waybill for Sprinter" do
      assert Sprinter.parse(params()) == %Sprinter{
               identifier: "identifier",
               sender_identifier: "sender_identifier",
               code_of_direction: "code_of_direction",
               package_identifier: "package_identifier",
               barcode_postfix: "barcode_postfix",
               delivery_deadline: "delivery_deadline"
             }
    end

    test "should parse an empty waybill for Sprinter" do
      assert Sprinter.parse(nil) == nil
    end
  end

  describe "validate/1" do
    test "should validate a valid waybill for Sprinter" do
      struct = Sprinter.parse(params())

      assert Sprinter.validate(struct) == :ok
    end

    test "should validate an invalid waybill for Sprinter" do
      assert Sprinter.validate(%{
               identifier: 0,
               sender_identifier: 0,
               code_of_direction: 0,
               package_identifier: 0,
               barcode_postfix: 0,
               delivery_deadline: 0
             }) ==
               {:error,
                %{
                  identifier: :invalid,
                  sender_identifier: :invalid,
                  code_of_direction: :invalid,
                  package_identifier: :invalid,
                  barcode_postfix: :invalid,
                  delivery_deadline: :invalid
                }}
    end
  end

  def params() do
    SprinterFactory.get_params(%{nope: "nope"})
  end
end
