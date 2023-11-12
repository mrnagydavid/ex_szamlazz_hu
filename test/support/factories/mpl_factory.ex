defmodule ExSzamlazzHu.Factories.MPLFactory do
  @moduledoc false

  def get_params(params \\ %{}) do
    %{
      vevokod: "buyer_identifier",
      vonalkod: "barcode",
      tomeg: "weight",
      kulonszolgaltatasok: "extra_services",
      erteknyilvanitas: "value_statement"
    }
    |> Map.merge(params)
  end
end
