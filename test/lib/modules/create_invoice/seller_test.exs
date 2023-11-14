defmodule ExSzamlazzHu.CreateInvoice.SellerTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.CreateInvoice.Seller
  alias ExSzamlazzHu.Factories.SellerFactory

  describe "parse/1" do
    test "should parse a valid Seller" do
      assert Seller.parse(params()) == %Seller{
               bank: "bank",
               bankszamlaszam: "bank_account_number",
               emailReplyto: "email_reply_to",
               emailTargy: "email_subject",
               emailSzoveg: "email_text",
               alairoNeve: "name_of_signatory"
             }
    end

    test "should parse an empty Seller" do
      assert Seller.parse(nil) == nil
    end
  end

  describe "to_xml/1" do
    test "should return a valid XML" do
      assert params()
             |> Seller.parse()
             |> Seller.to_xml() ==
               """
               <elado>
               <bank>bank</bank>
               <bankszamlaszam>bank_account_number</bankszamlaszam>
               <emailReplyto>email_reply_to</emailReplyto>
               <emailTargy>email_subject</emailTargy>
               <emailSzoveg>email_text</emailSzoveg>
               <alairoNeve>name_of_signatory</alairoNeve>
               </elado>
               """
    end
  end

  def params() do
    SellerFactory.get_params(%{nope: "nope"})
  end
end
