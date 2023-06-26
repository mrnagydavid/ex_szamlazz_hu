defmodule ExSzamlazzHu.Modules.CreateInvoice.ItemLedger do
  alias ExSzamlazzHu.Utils.Validator

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

  @spec validate(t()) :: boolean()
  def validate(struct) do
    %{
      economic_event: &(is_nil(&1) or is_binary(&1)),
      economic_event_vat: &(is_nil(&1) or is_binary(&1)),
      income_ledger_number: &(is_nil(&1) or is_binary(&1)),
      settlement_date_from: &(is_nil(&1) or is_binary(&1)),
      settlement_date_to: &(is_nil(&1) or is_binary(&1))
    }
    |> Validator.validate(struct)
  end

  defp maybe_parse_date(%Date{} = value), do: Date.to_iso8601(value)
  defp maybe_parse_date(value), do: value
end
