defmodule ExSzamlazzHu.Modules.CreateInvoice.ItemLedger do
  @type t :: %__MODULE__{}

  defstruct [
    :economic_event,
    :economic_event_vat,
    :income_ledger_number,
    :settlement_date_from,
    :settlement_date_to
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      economic_event: params[:economic_event],
      economic_event_vat: params[:economic_event_vat],
      income_ledger_number: params[:income_ledger_number],
      settlement_date_from: maybe_parse_date(params[:settlement_date_from]),
      settlement_date_to: maybe_parse_date(params[:settlement_date_to])
    }
  end

  defp maybe_parse_date(%Date{} = value), do: Date.to_iso8601(value)
  defp maybe_parse_date(value), do: value
end
