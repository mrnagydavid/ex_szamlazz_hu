defmodule ExSzamlazzHu.CreateInvoice.Waybill.MPLTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.CreateInvoice.Waybill.MPL
  alias ExSzamlazzHu.Factories.MPLFactory

  describe "parse/1" do
    test "should parse a valid waybill for MPL" do
      assert MPL.parse(params()) == %MPL{
               vevokod: "buyer_identifier",
               vonalkod: "barcode",
               tomeg: "weight",
               kulonszolgaltatasok: "extra_services",
               erteknyilvanitas: "value_statement"
             }
    end

    test "should parse an empty waybill for MPL" do
      assert MPL.parse(nil) == nil
    end
  end

  describe "to_xml/1" do
    test "should parse a valid waybill for MPL" do
      assert params()
             |> MPL.parse()
             |> MPL.to_xml() ==
               """
               <mpl>
               <vevokod>buyer_identifier</vevokod>
               <vonalkod>barcode</vonalkod>
               <tomeg>weight</tomeg>
               <kulonszolgaltatasok>extra_services</kulonszolgaltatasok>
               <erteknyilvanitas>value_statement</erteknyilvanitas>
               </mpl>
               """
    end
  end

  def params() do
    MPLFactory.get_params(%{nope: "nope"})
  end
end
