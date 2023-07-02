defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.TransoflexTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.Transoflex
  alias ExSzamlazzHu.Factories.TransoflexFactory

  describe "parse/1" do
    test "should parse a valid waybill for Transoflex" do
      assert Transoflex.parse(params()) == %Transoflex{
               identifier: "identifier",
               shipment_id: "shipment_id",
               package_identifier: "package_identifier",
               country_code: "country_code",
               zip: "zip",
               service: "service"
             }
    end

    test "should parse an empty waybill for Transoflex" do
      assert Transoflex.parse(nil) == nil
    end
  end

  describe "validate/1" do
    test "should validate a valid waybill for Transoflex" do
      struct = Transoflex.parse(params())

      assert Transoflex.validate(struct) == :ok
    end

    test "should validate an invalid waybill for Transoflex" do
      assert Transoflex.validate(%{
               identifier: 0,
               shipment_id: 0,
               package_identifier: 0,
               country_code: 0,
               zip: 0,
               service: 0
             }) ==
               {:error,
                %{
                  identifier: :invalid,
                  shipment_id: :invalid,
                  package_identifier: :invalid,
                  country_code: :invalid,
                  zip: :invalid,
                  service: :invalid
                }}
    end
  end

  def params() do
    TransoflexFactory.get_params(%{nope: "nope"})
  end
end
