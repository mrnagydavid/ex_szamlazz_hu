defmodule ExSzamlazzHu.CreateInvoice.SettingsTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.CreateInvoice.Settings
  alias ExSzamlazzHu.Factories.SettingsFactory

  describe "parse/1" do
    test "should parse a valid Settings" do
      assert Settings.parse(params()) == %Settings{
               felhasznalo: "user",
               jelszo: "password",
               szamlaagentkulcs: "agent_key",
               eszamla: true,
               szamlaLetoltes: false,
               szamlaLetoltesPld: 0,
               valaszVerzio: 1,
               aggregator: "aggregator",
               guardian: false,
               cikkazoninvoice: false,
               szamlaKulsoAzon: "external_invoice_identifier"
             }
    end

    test "should parse an empty Settings" do
      assert Settings.parse(nil) == nil
    end
  end

  describe "to_xml/1" do
    test "should return a valid XML" do
      assert params()
             |> Settings.parse()
             |> Settings.to_xml() ==
               """
               <?xml version="1.0" encoding="UTF-8"?>
               <beallitasok>
                 <felhasznalo>user</felhasznalo>
                 <jelszo>password</jelszo>
                 <szamlaagentkulcs>agent_key</szamlaagentkulcs>
                 <eszamla>true</eszamla>
                 <szamlaLetoltes>false</szamlaLetoltes>
                 <szamlaLetoltesPld>0</szamlaLetoltesPld>
                 <valaszVerzio>1</valaszVerzio>
                 <aggregator>aggregator</aggregator>
                 <guardian>false</guardian>
                 <cikkazoninvoice>false</cikkazoninvoice>
                 <szamlaKulsoAzon>external_invoice_identifier</szamlaKulsoAzon>
               </beallitasok>
               """
    end
  end

  def params() do
    SettingsFactory.get_params(%{nope: "nope"})
  end
end
