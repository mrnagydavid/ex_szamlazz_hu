defmodule ExSzamlazzHu.Factories.ItemLedgerFactory do
  @moduledoc false

  def get_params(params \\ %{}) do
    %{
      gazdasagiEsem: "economic_event",
      gazdasagiEsemAfa: "economic_event_vat",
      arbevetelFokonyviSzam: "income_ledger_number",
      afaFokonyviSzam: "vat_ledger_number",
      elszDatumTol: "settlement_date_from",
      elszDatumIg: "settlement_date_to"
    }
    |> Map.merge(params)
  end
end
