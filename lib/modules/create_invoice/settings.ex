defmodule ExSzamlazzHu.Modules.CreateInvoice.Settings do
  @type t :: %__MODULE__{}

  @enforce_keys [:e_invoice, :download_invoice]
  defstruct [
    :user,
    :password,
    :agent_key,
    :e_invoice,
    :download_invoice,
    :download_invoice_number_of_copies,
    :response_version,
    :aggregator,
    :guardian,
    :article_identifier_invoice,
    :external_invoice_identifier
  ]

  @spec parse(map()) :: t()
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      user: params[:user],
      password: params[:password],
      agent_key: params[:agent_key],
      e_invoice: params[:e_invoice],
      download_invoice: params[:download_invoice],
      download_invoice_number_of_copies: params[:download_invoice_number_of_copies],
      response_version: params[:response_version],
      aggregator: params[:aggregator],
      guardian: params[:guardian],
      article_identifier_invoice: params[:article_identifier_invoice],
      external_invoice_identifier: params[:external_invoice_identifier]
    }
  end
end
