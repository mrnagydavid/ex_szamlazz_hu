defmodule ExSzamlazzHu.Factories.TransoflexFactory do
  def get_params(params \\ %{}) do
    %{
      identifier: "identifier",
      shipment_id: "shipment_id",
      package_identifier: "package_identifier",
      country_code: "country_code",
      zip: "zip",
      service: "service"
    }
    |> Map.merge(params)
  end
end
