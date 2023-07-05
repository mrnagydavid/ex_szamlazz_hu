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

  describe "validate/1" do
    test "should validate a valid Buyer" do
      struct = Buyer.parse(params())

      assert Buyer.validate(struct) == :ok
    end

    test "should indicate required fields" do
      result =
        params()
        |> Enum.map(fn {k, _} -> {k, nil} end)
        |> Buyer.parse()
        |> Buyer.validate()

      assert result ==
               {:error,
                %{
                  name: :invalid,
                  zip_code: :invalid,
                  city: :invalid,
                  address: :invalid
                }}
    end

    test "should validate an invalid Buyer" do
      assert Buyer.validate(%{
               name: 0,
               country: 0,
               zip_code: 0,
               city: 0,
               address: 0,
               email: 0,
               send_email: "0",
               tax_subject: "0",
               tax_identifier: 0,
               group_identifier: 0,
               eu_tax_identifier: 0,
               mailing_name: 0,
               mailing_country: 0,
               mailing_zip: 0,
               mailing_city: 0,
               mailing_address: 0,
               buyer_ledger: %{
                 accounting_date: 0,
                 customer_identifier: 0,
                 ledger_number: 0,
                 continuous_delivery: 0,
                 settlement_date_from: 0,
                 settlement_date_to: 0
               },
               identifier: 0,
               name_of_signatory: 0,
               phone_number: 0,
               comment: 0
             }) ==
               {:error,
                %{
                  name: :invalid,
                  country: :invalid,
                  zip_code: :invalid,
                  city: :invalid,
                  address: :invalid,
                  email: :invalid,
                  send_email: :invalid,
                  tax_subject: :invalid,
                  tax_identifier: :invalid,
                  group_identifier: :invalid,
                  eu_tax_identifier: :invalid,
                  mailing_name: :invalid,
                  mailing_country: :invalid,
                  mailing_zip: :invalid,
                  mailing_city: :invalid,
                  mailing_address: :invalid,
                  buyer_ledger: %{
                    accounting_date: :invalid,
                    customer_identifier: :invalid,
                    ledger_number: :invalid,
                    continuous_delivery: :invalid,
                    settlement_date_from: :invalid,
                    settlement_date_to: :invalid
                  },
                  identifier: :invalid,
                  name_of_signatory: :invalid,
                  phone_number: :invalid,
                  comment: :invalid
                }}
    end
  end

  def params() do
    BuyerFactory.get_params(%{nope: "nope"})
  end
end
