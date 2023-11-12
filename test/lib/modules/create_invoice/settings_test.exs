defmodule ExSzamlazzHu.Modules.CreateInvoice.SettingsTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Settings
  alias ExSzamlazzHu.Factories.SettingsFactory

  describe "parse/1" do
    test "should parse a valid Settings" do
      assert Settings.parse(params()) == %Settings{
               user: "user",
               password: "password",
               agent_key: "agent_key",
               e_invoice: true,
               download_invoice: false,
               download_invoice_number_of_copies: 0,
               response_version: 1,
               aggregator: "aggregator",
               guardian: false,
               article_identifier_invoice: false,
               external_invoice_identifier: "external_invoice_identifier"
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
