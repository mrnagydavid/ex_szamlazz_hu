defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.PPPTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.PPP
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

  def params() do
    PPPFactory.get_params(%{nope: "nope"})
  end
end
