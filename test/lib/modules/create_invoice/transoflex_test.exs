defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.TransoflexTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.Transoflex
  alias ExSzamlazzHu.Factories.TransoflexFactory

  describe "parse/1" do
    test "should parse a valid waybill for Transoflex" do
      assert Transoflex.parse(params()) == %Transoflex{
               azonosito: "identifier",
               shipmentID: "shipment_id",
               csomagszam: "package_identifier",
               countryCode: "country_code",
               zip: "zip",
               service: "service"
             }
    end

    test "should parse an empty waybill for Transoflex" do
      assert Transoflex.parse(nil) == nil
    end
  end

  def params() do
    TransoflexFactory.get_params(%{nope: "nope"})
  end
end
