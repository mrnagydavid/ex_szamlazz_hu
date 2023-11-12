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

  def params() do
    ItemFactory.get_params(%{nope: "nope"})
  end
end
