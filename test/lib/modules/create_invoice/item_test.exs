defmodule ExSzamlazzHu.Modules.CreateInvoice.ItemTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Item
  alias ExSzamlazzHu.Factories.ItemFactory

  describe "parse/1" do
    test "should parse a valid Item" do
      assert Item.parse(params()) == %Item{
               megnevezes: "name",
               azonosito: "identifier",
               mennyiseg: "1.5",
               mennyisegiEgyseg: "unit",
               nettoEgysegar: "net_unit_price",
               afakulcs: "27",
               arresAfaAlap: "margin_vat_base",
               nettoErtek: "100",
               afaErtek: "27",
               bruttoErtek: "127",
               megjegyzes: "comment",
               tetelFokonyv: nil
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
