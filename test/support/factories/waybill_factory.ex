defmodule ExSzamlazzHu.Factories.WaybillFactory do
  alias ExSzamlazzHu.Factories.MPLFactory
  alias ExSzamlazzHu.Factories.PPPFactory
  alias ExSzamlazzHu.Factories.TransoflexFactory
  alias ExSzamlazzHu.Factories.SprinterFactory

  @three_pls [:tof, :ppp, :sprinter, :mpl]

  def get_params(params \\ %{}) do
    %{
      uticel: "destination",
      futarSzolgalat: "three_pl_provider",
      vonalkod: "barcode",
      megjegyzes: "comment",
      tof: nil,
      ppp: nil,
      sprinter: nil,
      mpl: nil
    }
    |> Map.merge(params)
    |> maybe_add_3pl()
  end

  defp maybe_add_3pl(params) do
    @three_pls
    |> Enum.filter(&(params[&1] != nil))
    |> Enum.reduce(params, fn three_pl, params ->
      value =
        case three_pl do
          :mpl -> MPLFactory.get_params(params[:mpl])
          :ppp -> PPPFactory.get_params(params[:ppp])
          :tof -> TransoflexFactory.get_params(params[:tof])
          :sprinter -> SprinterFactory.get_params(params[:sprinter])
        end

      Map.put(params, three_pl, value)
    end)
  end
end
