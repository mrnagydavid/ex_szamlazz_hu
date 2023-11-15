defmodule ExSzamlazzHu.CreateInvoice.Waybill.PPPTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.CreateInvoice.Waybill.PPP
  alias ExSzamlazzHu.Factories.PPPFactory

  describe "parse/1" do
    test "should parse a valid waybill for PPP" do
      assert PPP.parse(params()) == %PPP{
               vonalkodPrefix: "barcode_prefix",
               vonalkodPostfix: "barcode_postfix"
             }
    end

    test "should parse an empty waybill for PPP" do
      assert PPP.parse(nil) == nil
    end
  end

  describe "to_xml/1" do
    test "should return a valid XML" do
      assert params()
             |> PPP.parse()
             |> PPP.to_xml() ==
               """
               <?xml version="1.0" encoding="UTF-8"?>
               <ppp>
                 <vonalkodPrefix>barcode_prefix</vonalkodPrefix>
                 <vonalkodPostfix>barcode_postfix</vonalkodPostfix>
               </ppp>
               """
    end
  end

  def params() do
    PPPFactory.get_params(%{nope: "nope"})
  end
end
