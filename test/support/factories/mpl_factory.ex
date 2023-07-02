defmodule ExSzamlazzHu.Factories.MPLFactory do
  def get_params(params \\ %{}) do
    %{
      buyer_identifier: "buyer_identifier",
      barcode: "barcode",
      weight: "weight",
      extra_services: "extra_services",
      value_statement: "value_statement"
    }
    |> Map.merge(params)
  end
end
