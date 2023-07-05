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

  describe "validate/1" do
    test "should validate a valid waybill" do
      struct = Waybill.parse(params())

      assert Waybill.validate(struct) == :ok
    end

    test "should validate an invalid waybill" do
      assert Waybill.validate(%{
               destination: 0,
               three_pl_provider: 0,
               barcode: 0,
               comment: 0,
               mpl: %{
                 buyer_identifier: 0,
                 barcode: 0,
                 weight: 0,
                 extra_services: 0,
                 value_statement: 0
               }
             }) ==
               {:error,
                %{
                  destination: :invalid,
                  three_pl_provider: :invalid,
                  barcode: :invalid,
                  comment: :invalid,
                  mpl: %{
                    buyer_identifier: :invalid,
                    barcode: :invalid,
                    weight: :invalid,
                    extra_services: :invalid,
                    value_statement: :invalid
                  }
                }}
    end
  end

  def params(custom_params \\ %{}) do
    %{nope: "nope", mpl: %{}}
    |> Map.merge(custom_params)
    |> WaybillFactory.get_params()
  end
end
