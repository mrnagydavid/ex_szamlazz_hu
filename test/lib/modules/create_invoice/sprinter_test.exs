defmodule ExSzamlazzHu.Modules.CreateInvoice.Waybill.SprinterTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.Sprinter
  alias ExSzamlazzHu.Factories.SprinterFactory

  describe "parse/1" do
    test "should parse a valid waybill for Sprinter" do
      assert Sprinter.parse(params()) == %Sprinter{
               azonosito: "identifier",
               feladokod: "sender_identifier",
               iranykod: "code_of_direction",
               csomagszam: "package_identifier",
               vonalkodPostfix: "barcode_postfix",
               szallitasiIdo: "delivery_deadline"
             }
    end

    test "should parse an empty waybill for Sprinter" do
      assert Sprinter.parse(nil) == nil
    end
  end

  def params() do
    SprinterFactory.get_params(%{nope: "nope"})
  end
end
