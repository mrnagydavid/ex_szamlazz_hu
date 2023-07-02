defmodule ExSzamlazzHu.Factories.SprinterFactory do
  def get_params(params \\ %{}) do
    %{
      identifier: "identifier",
      sender_identifier: "sender_identifier",
      code_of_direction: "code_of_direction",
      package_identifier: "package_identifier",
      barcode_postfix: "barcode_postfix",
      delivery_deadline: "delivery_deadline",
    }
    |> Map.merge(params)
  end
end
