defmodule ExSzamlazzHu.Modules.CreateInvoice.BuyerLedger do
  alias ExSzamlazzHu.Utils.Validator

  @type t :: %__MODULE__{}

  defstruct [
    :accounting_date,
    :customer_identifier,
    :ledger_number,
    :continuous_delivery,
    :settlement_date_from,
    :settlement_date_to
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      accounting_date: params[:accounting_date],
      customer_identifier: params[:customer_identifier],
      ledger_number: params[:ledger_number],
      continuous_delivery: params[:continuous_delivery],
      settlement_date_from: maybe_parse_date(params[:settlement_date_from]),
      settlement_date_to: maybe_parse_date(params[:settlement_date_to])
    }
  end

  @spec validate(t()) :: boolean()
  def validate(struct) do
    %{
      accounting_date: &(is_nil(&1) or is_binary(&1)),
      customer_identifier: &(is_nil(&1) or is_binary(&1)),
      ledger_number: &(is_nil(&1) or is_binary(&1)),
      continuous_delivery: &(is_nil(&1) or is_binary(&1)),
      settlement_date_from: &(is_nil(&1) or is_binary(&1)),
      settlement_date_to: &(is_nil(&1) or is_binary(&1))
    }
    |> Validator.validate(struct)
  end

  defp maybe_parse_date(%Date{} = value), do: Date.to_iso8601(value)
  defp maybe_parse_date(value), do: value
end
