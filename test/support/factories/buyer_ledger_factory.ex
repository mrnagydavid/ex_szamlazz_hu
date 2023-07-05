defmodule ExSzamlazzHu.Factories.BuyerLedgerFactory do
  def get_params(params \\ %{}) do
    %{
      accounting_date: "accounting_date",
      customer_identifier: "customer_identifier",
      ledger_number: "ledger_number",
      continuous_delivery: "continuous_delivery",
      settlement_date_from: "settlement_date_from",
      settlement_date_to: "settlement_date_to"
    }
    |> Map.merge(params)
  end
end
