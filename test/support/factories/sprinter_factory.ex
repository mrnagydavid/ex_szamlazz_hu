defmodule ExSzamlazzHu.Factories.SprinterFactory do
  def get_params(params \\ %{}) do
    %{
      azonosito: "identifier",
      feladokod: "sender_identifier",
      iranykod: "code_of_direction",
      csomagszam: "package_identifier",
      vonalkodPostfix: "barcode_postfix",
      szallitasiIdo: "delivery_deadline"
    }
    |> Map.merge(params)
  end
end
