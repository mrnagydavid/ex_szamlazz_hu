defmodule ExSzamlazzHu.Modules.CreateInvoice.Settings do
  alias ExSzamlazzHu.Utils.Validator

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

  @spec validate(t()) :: boolean()
  def validate(struct) do
    %{
      user: &(is_nil(&1) or is_binary(&1)),
      password: &(is_nil(&1) or is_binary(&1)),
      agent_key: &(is_nil(&1) or is_binary(&1)),
      e_invoice: &is_boolean/1,
      download_invoice: &is_boolean/1,
      download_invoice_number_of_copies: &(is_nil(&1) or is_integer(&1)),
      response_version: &(is_nil(&1) or is_integer(&1)),
      aggregator: &(is_nil(&1) or is_binary(&1)),
      guardian: &(is_nil(&1) or is_boolean(&1)),
      article_identifier_invoice: &(is_nil(&1) or is_boolean(&1)),
      external_invoice_identifier: &(is_nil(&1) or is_binary(&1))
    }
    |> Validator.validate(struct)
  end
end
