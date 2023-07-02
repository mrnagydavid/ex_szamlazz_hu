defmodule ExSzamlazzHu.Factories.WaybillFactory do
  alias ExSzamlazzHu.Factories.MPLFactory
  alias ExSzamlazzHu.Factories.PPPFactory
  alias ExSzamlazzHu.Factories.TransoflexFactory
  alias ExSzamlazzHu.Factories.SprinterFactory

  @three_pls [:transoflex, :ppp, :sprinter, :mpl]

  def get_params(params \\ %{}) do
    %{
      destination: "destination",
      three_pl_provider: "three_pl_provider",
      barcode: "barcode",
      comment: "comment",
      transoflex: nil,
      ppp: nil,
      sprinter: nil,
      mpl: nil
    }
    |> Map.merge(params)
    |> maybe_add_3pl()
  end

  defp maybe_add_3pl(params) do
    if Enum.all?(@three_pls, &(params[&1] == nil)) do
      add_any_3pl(params)
    else
      add_specific_3pl(params)
    end
  end

  defp add_any_3pl(params) do
    Map.merge(params, %{
      mpl: MPLFactory.get_params()
    })
  end

  defp add_specific_3pl(params) do
    @three_pls
    |> Enum.filter(&(params[&1] != nil))
    |> Enum.reduce(params, fn three_pl, params ->
      value =
        case three_pl do
          :mpl -> MPLFactory.get_params(params[:mpl])
          :ppp -> PPPFactory.get_params(params[:ppp])
          :transoflex -> TransoflexFactory.get_params(params[:transoflex])
          :sprinter -> SprinterFactory.get_params(params[:sprinter])
        end

      Map.put(params, three_pl, value)
    end)
  end
end
