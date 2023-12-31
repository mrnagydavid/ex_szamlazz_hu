defmodule ExSzamlazzHu.CreateInvoice.Result do
  @moduledoc """
  Represents the result of the invoice creation call.

  See the [documentation](https://hexdocs.pm/ex_szamlazz_hu)
  """
  @moduledoc since: "0.1.0"

  @type t() :: %__MODULE__{}

  defstruct success: nil,
            raw_response: nil,
            szlahu_id: nil,
            szlahu_szamlaszam: nil,
            szlahu_nettovegosszeg: nil,
            szlahu_bruttovegosszeg: nil,
            szlahu_kintlevoseg: nil,
            szlahu_vevoifiokurl: nil,
            path_to_pdf_invoice: nil,
            szlahu_error: nil,
            szlahu_error_code: nil,
            szlahu_down: false
end
