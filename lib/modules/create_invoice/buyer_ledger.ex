defmodule ExSzamlazzHu.Modules.CreateInvoice.BuyerLedger do
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

  defp maybe_parse_date(%Date{} = value), do: Date.to_iso8601(value)
  defp maybe_parse_date(value), do: value
end
