defmodule ExSzamlazzHu.Factories.InvoiceDataFactory do
  alias ExSzamlazzHu.Factories.SettingsFactory
  alias ExSzamlazzHu.Factories.HeaderFactory
  alias ExSzamlazzHu.Factories.CustomerFactory
  alias ExSzamlazzHu.Factories.SellerFactory
  alias ExSzamlazzHu.Factories.WaybillFactory
  alias ExSzamlazzHu.Factories.ItemFactory

  def get_params(params \\ %{}) do
    %{}
    |> Map.merge(params)
    |> Map.put_new_lazy(:beallitasok, fn -> SettingsFactory.get_params() end)
    |> Map.put_new_lazy(:fejlec, fn -> HeaderFactory.get_params() end)
    |> Map.put_new_lazy(:elado, fn -> SellerFactory.get_params() end)
    |> Map.put_new_lazy(:vevo, fn -> CustomerFactory.get_params() end)
    |> Map.put_new_lazy(:fuvarlevel, fn -> WaybillFactory.get_params() end)
    |> Map.put_new_lazy(:tetelek, fn -> [ItemFactory.get_params()] end)
  end
end
