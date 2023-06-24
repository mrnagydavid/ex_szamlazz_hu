defmodule ExSzamlazzHu.Modules.CreateInvoice do
  alias ExSzamlazzHu.Modules.CreateInvoice.InvoiceData
  alias ExSzamlazzHu.Modules.CreateInvoice.XMLBuilder

  def run(params) do
    params
    |> InvoiceData.parse()
    |> IO.inspect()
    |> XMLBuilder.build()
    |> IO.inspect()
  end
end
