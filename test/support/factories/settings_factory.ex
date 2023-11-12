defmodule ExSzamlazzHu.Factories.SettingsFactory do
  def get_params(params \\ %{}) do
    %{
      user: "user",
      password: "password",
      agent_key: "agent_key",
      is_e_invoice: true,
      download_invoice: false,
      download_invoice_number_of_copies: 0,
      response_version: 1,
      aggregator: "aggregator",
      guardian: false,
      article_identifier_invoice: false,
      external_invoice_identifier: "external_invoice_identifier"
    }
    |> Map.merge(params)
  end
end
