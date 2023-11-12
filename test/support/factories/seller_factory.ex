defmodule ExSzamlazzHu.Factories.SellerFactory do
  def get_params(params \\ %{}) do
    %{
      bank: "bank",
      bankszamlaszam: "bank_account_number",
      emailReplyto: "email_reply_to",
      emailTargy: "email_subject",
      emailSzoveg: "email_text",
      alairoNeve: "name_of_signatory"
    }
    |> Map.merge(params)
  end
end
