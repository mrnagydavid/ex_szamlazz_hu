defmodule ExSzamlazzHu.Factories.PPPFactory do
  def get_params(params \\ %{}) do
    %{
      vonalkodPrefix: "barcode_prefix",
      vonalkodPostfix: "barcode_postfix"
    }
    |> Map.merge(params)
  end
end
