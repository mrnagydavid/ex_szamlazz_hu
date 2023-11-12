defmodule ExSzamlazzHu.Modules.CreateInvoice.SellerTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Seller
  alias ExSzamlazzHu.Factories.SellerFactory

  describe "parse/1" do
    test "should parse a valid Seller" do
      assert Seller.parse(params()) == %Seller{
               bank: "bank",
               bank_account_number: "bank_account_number",
               email_reply_to: "email_reply_to",
               email_subject: "email_subject",
               email_text: "email_text",
               name_of_signatory: "name_of_signatory"
             }
    end

    test "should parse an empty Seller" do
      assert Seller.parse(nil) == nil
    end
  end

  def params() do
    SellerFactory.get_params(%{nope: "nope"})
  end
end
