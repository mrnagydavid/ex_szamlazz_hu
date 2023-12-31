defmodule ExSzamlazzHu.CreateInvoice.ItemsTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.CreateInvoice.Items
  alias ExSzamlazzHu.CreateInvoice.Items.Item
  alias ExSzamlazzHu.Factories.ItemFactory
  alias ExSzamlazzHu.Factories.ItemLedgerFactory

  describe "parse/1" do
    test "should parse a valid Item list" do
      assert Items.parse(params()) == %Items{
               tetelek: [
                 %Item{
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
               ]
             }
    end

    test "should parse an empty Item list" do
      assert Items.parse(nil) == []
    end
  end

  describe "to_xml/1" do
    test "should return a valid XML" do
      assert %{tetelFokonyv: ItemLedgerFactory.get_params()}
             |> params()
             |> Items.parse()
             |> Items.to_xml() ==
               """
               <?xml version="1.0" encoding="UTF-8"?>
               <tetelek>
                 <tetel>
                   <megnevezes>name</megnevezes>
                   <azonosito>identifier</azonosito>
                   <mennyiseg>1.5</mennyiseg>
                   <mennyisegiEgyseg>unit</mennyisegiEgyseg>
                   <nettoEgysegar>net_unit_price</nettoEgysegar>
                   <afakulcs>27</afakulcs>
                   <arresAfaAlap>margin_vat_base</arresAfaAlap>
                   <nettoErtek>100</nettoErtek>
                   <afaErtek>27</afaErtek>
                   <bruttoErtek>127</bruttoErtek>
                   <megjegyzes>comment</megjegyzes>
                   <tetelFokonyv>
                     <gazdasagiEsem>economic_event</gazdasagiEsem>
                     <gazdasagiEsemAfa>economic_event_vat</gazdasagiEsemAfa>
                     <arbevetelFokonyviSzam>income_ledger_number</arbevetelFokonyviSzam>
                     <afaFokonyviSzam>vat_ledger_number</afaFokonyviSzam>
                     <elszDatumTol>settlement_date_from</elszDatumTol>
                     <elszDatumIg>settlement_date_to</elszDatumIg>
                   </tetelFokonyv>
                 </tetel>
               </tetelek>
               """
    end
  end

  defp params(params \\ %{}) do
    [ItemFactory.get_params(params)]
  end
end
