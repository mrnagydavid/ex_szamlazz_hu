defmodule ExSzamlazzHu.Factories.PPPFactory do
  def get_params(params \\ %{}) do
    %{
      barcode_prefix: "barcode_prefix",
      barcode_postfix: "barcode_postfix"
    }
    |> Map.merge(params)
  end
end
