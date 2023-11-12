defmodule ExSzamlazzHu.Modules.CreateInvoice.BuyerTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Buyer
  alias ExSzamlazzHu.Factories.BuyerFactory

  describe "parse/1" do
    test "should parse a valid Buyer" do
      assert Buyer.parse(params()) == %Buyer{
               name: "name",
               country: "country",
               zip_code: "zip_code",
               city: "city",
               address: "address",
               email: "email",
               send_email: false,
               tax_subject: 123,
               tax_identifier: "tax_identifier",
               group_identifier: "group_identifier",
               eu_tax_identifier: "eu_tax_identifier",
               mailing_name: "mailing_name",
               mailing_country: "mailing_country",
               mailing_zip: "mailing_zip",
               mailing_city: "mailing_city",
               mailing_address: "mailing_address",
               buyer_ledger: nil,
               identifier: "identifier",
               name_of_signatory: "name_of_signatory",
               phone_number: "phone_number",
               comment: "comment"
             }
    end

    test "should parse an empty Buyer" do
      assert Buyer.parse(nil) == nil
    end
  end

  def params() do
    BuyerFactory.get_params(%{nope: "nope"})
  end
end
