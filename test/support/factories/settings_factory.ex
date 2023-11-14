defmodule ExSzamlazzHu.Factories.SettingsFactory do
  @moduledoc false

  def get_params(params \\ %{}) do
    %{
      felhasznalo: "user",
      jelszo: "password",
      szamlaagentkulcs: "agent_key",
      eszamla: true,
      szamlaLetoltes: false,
      szamlaLetoltesPld: 0,
      valaszVerzio: 1,
      aggregator: "aggregator",
      guardian: false,
      cikkazoninvoice: false,
      szamlaKulsoAzon: "external_invoice_identifier"
    }
    |> Map.merge(params)
  end
end
