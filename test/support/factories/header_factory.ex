defmodule ExSzamlazzHu.Factories.HeaderFactory do
  @moduledoc false

  def get_params(params \\ %{}) do
    %{
      keltDatum: "1997-08-29",
      teljesitesDatum: "1997-08-29",
      fizetesiHataridoDatum: "1997-08-29",
      fizmod: "payment_method",
      penznem: "HUF",
      szamlaNyelve: "en",
      megjegyzes: "comment",
      arfolyamBank: "exchange_rate_bank",
      arfolyam: "123.4",
      rendelesSzam: "order_identifier",
      dijbekeroSzamlaszam: "fee_request_identifier",
      elolegszamla: false,
      vegszamla: true,
      elolegSzamlaszam: nil,
      helyesbitoszamla: false,
      helyesbitettSzamlaszam: nil,
      dijbekero: false,
      szallitolevel: false,
      logoExtra: "logo_extra",
      szamlaszamElotag: "PRFX",
      fizetendoKorrekcio: "123.4",
      fizetve: true,
      arresAfa: false,
      eusAfa: false,
      szamlaSablon: "invoice_draft",
      elonezetpdf: false
    }
    |> Map.merge(params)
  end
end
