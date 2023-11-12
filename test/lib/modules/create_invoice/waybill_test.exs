defmodule ExSzamlazzHu.Modules.CreateInvoice.WaybillTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.MPL
  alias ExSzamlazzHu.Factories.WaybillFactory

  describe "parse/1" do
    test "should parse a valid waybill" do
      assert Waybill.parse(params(%{mpl: %{}})) == %Waybill{
               uticel: "destination",
               futarSzolgalat: "three_pl_provider",
               vonalkod: "barcode",
               megjegyzes: "comment",
               tof: nil,
               ppp: nil,
               sprinter: nil,
               mpl: %MPL{
                 vevokod: "buyer_identifier",
                 vonalkod: "barcode",
                 tomeg: "weight",
                 kulonszolgaltatasok: "extra_services",
                 erteknyilvanitas: "value_statement"
               }
             }
    end

    test "should parse an empty waybill" do
      assert Waybill.parse(nil) == nil
    end
  end

  describe "to_xml/1" do
    test "should return a valid XML" do
      assert %{tof: %{}, ppp: %{}, sprinter: %{}, mpl: %{}}
             |> params()
             |> Waybill.parse()
             |> Waybill.to_xml() ==
               """
               <fuvarlevel>
               <uticel>destination</uticel>
               <futarSzolgalat>three_pl_provider</futarSzolgalat>
               <vonalkod>barcode</vonalkod>
               <megjegyzes>comment</megjegyzes>
               <tof>
               <azonosito>identifier</azonosito>
               <shipmentID>shipment_id</shipmentID>
               <csomagszam>package_identifier</csomagszam>
               <countryCode>country_code</countryCode>
               <zip>zip</zip>
               <service>service</service>
               </tof>
               <ppp>
               <vonalkodPrefix>barcode_prefix</vonalkodPrefix>
               <vonalkodPostfix>barcode_postfix</vonalkodPostfix>
               </ppp>
               <sprinter>
               <azonosito>identifier</azonosito>
               <feladokod>sender_identifier</feladokod>
               <iranykod>code_of_direction</iranykod>
               <csomagszam>package_identifier</csomagszam>
               <vonalkodPostfix>barcode_postfix</vonalkodPostfix>
               <szallitasiIdo>delivery_deadline</szallitasiIdo>
               </sprinter>
               <mpl>
               <vevokod>buyer_identifier</vevokod>
               <vonalkod>barcode</vonalkod>
               <tomeg>weight</tomeg>
               <kulonszolgaltatasok>extra_services</kulonszolgaltatasok>
               <erteknyilvanitas>value_statement</erteknyilvanitas>
               </mpl>
               </fuvarlevel>
               """
    end
  end

  def params(params \\ %{nope: "nope", mpl: %{}}) do
    WaybillFactory.get_params(params)
  end
end
