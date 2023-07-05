defmodule ExSzamlazzHu.Factories.BuyerFactory do
  alias ExSzamlazzHu.Factories.BuyerLedgerFactory

  def get_params(params \\ %{}) do
    %{
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
    |> Map.merge(params)
    |> maybe_add_buyer_ledger()
  end

  defp maybe_add_buyer_ledger(%{buyer_ledger: nil} = params), do: params

  defp maybe_add_buyer_ledger(params) do
    Map.put(params, :buyer_ledger, BuyerLedgerFactory.get_params(params[:buyer_ledger]))
  end
end
