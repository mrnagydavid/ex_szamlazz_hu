defmodule ExSzamlazzHu.Modules.CreateInvoice do
  alias ExSzamlazzHu.Modules.CreateInvoice.InvoiceData

  def run(params) do
    params
    |> InvoiceData.parse()
    |> IO.inspect()
    |> InvoiceData.to_xml()
    |> IO.inspect()
  end
end
