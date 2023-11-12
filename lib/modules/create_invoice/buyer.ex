defmodule ExSzamlazzHu.Modules.CreateInvoice.Buyer do
  alias ExSzamlazzHu.Modules.CreateInvoice.BuyerLedger

  @type t :: %__MODULE__{}

  @enforce_keys [
    :name,
    :zip_code,
    :city,
    :address
  ]
  defstruct [
    :name,
    :country,
    :zip_code,
    :city,
    :address,
    :email,
    :send_email,
    :tax_subject,
    :tax_identifier,
    :group_identifier,
    :eu_tax_identifier,
    :mailing_name,
    :mailing_country,
    :mailing_zip,
    :mailing_city,
    :mailing_address,
    :buyer_ledger,
    :identifier,
    :name_of_signatory,
    :phone_number,
    :comment
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      name: params[:name],
      country: params[:country],
      zip_code: params[:zip_code],
      city: params[:city],
      address: params[:address],
      email: params[:email],
      send_email: params[:send_email],
      tax_subject: params[:tax_subject],
      tax_identifier: params[:tax_identifier],
      group_identifier: params[:group_identifier],
      eu_tax_identifier: params[:eu_tax_identifier],
      mailing_name: params[:mailing_name],
      mailing_country: params[:mailing_country],
      mailing_zip: params[:mailing_zip],
      mailing_city: params[:mailing_city],
      mailing_address: params[:mailing_address],
      buyer_ledger: BuyerLedger.parse(params[:buyer_ledger]),
      identifier: params[:identifier],
      name_of_signatory: params[:name_of_signatory],
      phone_number: params[:phone_number],
      comment: params[:comment]
    }
  end
end
