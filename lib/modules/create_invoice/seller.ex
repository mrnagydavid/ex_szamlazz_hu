defmodule ExSzamlazzHu.Modules.CreateInvoice.Seller do
  alias ExSzamlazzHu.Utils.Validator

  @type t :: %__MODULE__{}

  defstruct [
    :bank,
    :bank_account_number,
    :email_reply_to,
    :email_subject,
    :email_text,
    :name_of_signatory
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      bank: params[:bank],
      bank_account_number: params[:bank_account_number],
      email_reply_to: params[:email_reply_to],
      email_subject: params[:email_subject],
      email_text: params[:email_text],
      name_of_signatory: params[:name_of_signatory]
    }
  end

  @spec validate(t()) :: boolean()
  def validate(struct) do
    %{
      bank: &(is_nil(&1) or is_binary(&1)),
      bank_account_number: &(is_nil(&1) or is_binary(&1)),
      email_reply_to: &(is_nil(&1) or is_binary(&1)),
      email_subject: &(is_nil(&1) or is_binary(&1)),
      email_text: &(is_nil(&1) or is_binary(&1)),
      name_of_signatory: &(is_nil(&1) or is_binary(&1))
    }
    |> Validator.validate(struct)
  end
end
