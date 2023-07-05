defmodule ExSzamlazzHu.Modules.CreateInvoice.ItemTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Item
  alias ExSzamlazzHu.Factories.ItemFactory

  describe "parse/1" do
    test "should parse a valid Item" do
      assert Item.parse(params()) == %Item{
               name: "name",
               identifier: "identifier",
               quantity: "1.5",
               unit: "unit",
               net_unit_price: "net_unit_price",
               vat_key: "27",
               margin_vat_base: "margin_vat_base",
               net_value: "100",
               vat_value: "27",
               gross_value: "127",
               comment: "comment",
               item_ledger: nil
             }
    end

    test "should parse an empty Item" do
      assert Item.parse(nil) == nil
    end
  end

  describe "validate/1" do
    test "should validate a valid Item" do
      struct = Item.parse(params())

      assert Item.validate(struct) == :ok
    end

    test "should indicate required fields" do
      result =
        params()
        |> Enum.map(fn {k, _} -> {k, nil} end)
        |> Item.parse()
        |> Item.validate()

      assert result ==
               {:error,
                %{
                  name: :invalid,
                  quantity: :invalid,
                  unit: :invalid,
                  net_unit_price: :invalid,
                  vat_key: :invalid,
                  net_value: :invalid,
                  vat_value: :invalid,
                  gross_value: :invalid
                }}
    end

    test "should validate an invalid Item" do
      assert Item.validate(%{
               name: 0,
               identifier: 0,
               quantity: 0,
               unit: 0,
               net_unit_price: 0,
               vat_key: 0,
               margin_vat_base: 0,
               net_value: 0,
               vat_value: 0,
               gross_value: 0,
               comment: 0,
               item_ledger: %{
                 economic_event: 0,
                 economic_event_vat: 0,
                 income_ledger_number: 0,
                 settlement_date_from: 0,
                 settlement_date_to: 0
               }
             }) ==
               {:error,
                %{
                  name: :invalid,
                  identifier: :invalid,
                  quantity: :invalid,
                  unit: :invalid,
                  net_unit_price: :invalid,
                  vat_key: :invalid,
                  margin_vat_base: :invalid,
                  net_value: :invalid,
                  vat_value: :invalid,
                  gross_value: :invalid,
                  comment: :invalid,
                  item_ledger: %{
                    economic_event: :invalid,
                    economic_event_vat: :invalid,
                    income_ledger_number: :invalid,
                    settlement_date_from: :invalid,
                    settlement_date_to: :invalid
                  }
                }}
    end
  end

  def params() do
    ItemFactory.get_params(%{nope: "nope"})
  end
end
