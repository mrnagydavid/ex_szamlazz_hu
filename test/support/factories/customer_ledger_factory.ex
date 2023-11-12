defmodule ExSzamlazzHu.Factories.CustomerLedgerFactory do
  def get_params(params \\ %{}) do
    %{
      konyvelesDatum: "accounting_date",
      vevoAzonosito: "customer_identifier",
      vevoFokonyviSzam: "ledger_number",
      folyamatosTelj: "continuous_delivery",
      elszDatumTol: "settlement_date_from",
      elszDatumIg: "settlement_date_to"
    }
    |> Map.merge(params)
  end
end
