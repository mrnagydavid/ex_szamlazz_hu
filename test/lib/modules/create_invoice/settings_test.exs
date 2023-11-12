defmodule ExSzamlazzHu.Modules.CreateInvoice.SettingsTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Settings
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

  def params() do
    SettingsFactory.get_params(%{nope: "nope"})
  end
end
