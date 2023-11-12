defmodule ExSzamlazzHu.Factories.SellerFactory do
  def get_params(params \\ %{}) do
    %{
      bank: "bank",
      bank_account_number: "bank_account_number",
      email_reply_to: "email_reply_to",
      email_subject: "email_subject",
      email_text: "email_text",
      name_of_signatory: "name_of_signatory"
    }
    |> Map.merge(params)
  end
end
