defmodule ExSzamlazzHu.Factories.TransoflexFactory do
  @moduledoc false

  def get_params(params \\ %{}) do
    %{
      azonosito: "identifier",
      shipmentID: "shipment_id",
      csomagszam: "package_identifier",
      countryCode: "country_code",
      zip: "zip",
      service: "service"
    }
    |> Map.merge(params)
  end
end
