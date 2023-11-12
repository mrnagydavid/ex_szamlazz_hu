defmodule ExSzamlazzHu.Modules.CreateInvoice.WaybillTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill
  alias ExSzamlazzHu.Modules.CreateInvoice.Waybill.MPL
  alias ExSzamlazzHu.Factories.WaybillFactory

  describe "parse/1" do
    test "should parse a valid waybill" do
      assert Waybill.parse(params(%{mpl: %{}})) == %Waybill{
               destination: "destination",
               three_pl_provider: "three_pl_provider",
               barcode: "barcode",
               comment: "comment",
               ppp: nil,
               sprinter: nil,
               transoflex: nil,
               mpl: %MPL{
                 buyer_identifier: "buyer_identifier",
                 barcode: "barcode",
                 weight: "weight",
                 extra_services: "extra_services",
                 value_statement: "value_statement"
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
