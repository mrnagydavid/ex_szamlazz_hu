defmodule ExSzamlazzHu.Factories.ItemLedgerFactory do
  def get_params(params \\ %{}) do
    %{
      economic_event: "economic_event",
      economic_event_vat: "economic_event_vat",
      income_ledger_number: "income_ledger_number",
      settlement_date_from: "settlement_date_from",
      settlement_date_to: "settlement_date_to"
    }
    |> Map.merge(params)
  end
end
