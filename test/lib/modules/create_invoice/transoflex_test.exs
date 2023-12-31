defmodule ExSzamlazzHu.CreateInvoice.Waybill.TransoflexTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.CreateInvoice.Waybill.Transoflex
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

  describe "to_xml/1" do
    test "should return a valid XML" do
      assert params()
             |> Transoflex.parse()
             |> Transoflex.to_xml() ==
               """
               <?xml version="1.0" encoding="UTF-8"?>
               <tof>
                 <azonosito>identifier</azonosito>
                 <shipmentID>shipment_id</shipmentID>
                 <csomagszam>package_identifier</csomagszam>
                 <countryCode>country_code</countryCode>
                 <zip>zip</zip>
                 <service>service</service>
               </tof>
               """
    end
  end

  def params() do
    TransoflexFactory.get_params(%{nope: "nope"})
  end
end
