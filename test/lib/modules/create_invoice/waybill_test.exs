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

  def params(custom_params \\ %{}) do
    %{nope: "nope", mpl: %{}}
    |> Map.merge(custom_params)
    |> WaybillFactory.get_params()
  end
end
