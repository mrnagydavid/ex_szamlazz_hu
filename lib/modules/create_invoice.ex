defmodule ExSzamlazzHu.Modules.CreateInvoice do
  alias Tesla.Multipart
  alias ExSzamlazzHu.Modules.CreateInvoice.InvoiceData
  alias ExSzamlazzHu.Utils.TemporaryFile

  def run(params) do
    with invoice_data <- InvoiceData.parse(params),
         xml <- InvoiceData.to_xml(invoice_data),
         {:ok, file_path} <- save_temporary_file(xml),
         {:ok, response} <- send_request(file_path),
         {:ok, success, data} <- handle_response(response, invoice_data) do
      if success do
        {:ok, %{response: response, info: data}}
      else
        {:error, %{response: response, info: data}}
      end
    else
      {:error, :cannot_save_temporary_file} -> {:error, :cannot_save_temporary_file}
      {:error, :szamlazz_hu_is_down} -> {:error, :szamlazz_hu_is_down}
    end
  end

  defp save_temporary_file(xml) do
    random_chars = for _ <- 1..5, into: "", do: <<Enum.random(?a..?z)>>
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    filename = "#{timestamp}_#{random_chars}.xml"

    TemporaryFile.save(filename, xml)
  end

  defp send_request(file_path) do
    body =
      Multipart.new()
      |> Multipart.add_content_type_param("charset=utf-8")
      |> Multipart.add_file(file_path, name: "action-xmlagentxmlfile")

    url = Application.get_env(:ex_szamlazz_hu, :szamlazz_hu_api_url)

    Tesla.post(url, body)
  end

  defp handle_response(%Tesla.Env{} = response, invoice_data) do
    header_map = Map.new(response.headers)

    cond do
      header_map["szlahu_down"] == "true" -> {:error, :szamlazz_hu_is_down}
      header_map["szlahu_error_code"] == nil -> handle_success_response(response, invoice_data)
      true -> handle_error_response(response)
    end
  end

  defp handle_error_response(%Tesla.Env{} = response) do
    header_map = Map.new(response.headers)

    result = %{
      szlahu_error: header_map["szlahu_error"],
      szlahu_error_code: header_map["szlahu_error_code"]
    }

    {:ok, false, result}
  end

  defp handle_success_response(%Tesla.Env{} = response, invoice_data) do
    header_map = Map.new(response.headers)

    result =
      %{
        szlahu_id: header_map["szlahu_id"],
        szlahu_nettovegosszeg: header_map["szlahu_nettovegosszeg"],
        szlahu_szamlaszam: header_map["szlahu_szamlaszam"],
        szlahu_bruttovegosszeg: header_map["szlahu_bruttovegosszeg"],
        szlahu_kintlevoseg: header_map["szlahu_kintlevoseg"],
        szlahu_vevoifiokurl: header_map["szlahu_vevoifiokurl"]
      }
      |> maybe_add_invoice_path_info(response, invoice_data)

    {:ok, true, result}
  end

  defp maybe_add_invoice_path_info(
         info,
         %Tesla.Env{} = response,
         %InvoiceData{beallitasok: %{szamlaLetoltes: true}} = invoice_data
       ) do
    random_chars = for _ <- 1..5, into: "", do: <<Enum.random(?a..?z)>>
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    filename = "#{timestamp}_#{random_chars}.pdf"
    pdf = get_invoice_pdf_data(response, invoice_data)

    case TemporaryFile.save(filename, pdf) do
      {:ok, path} -> Map.put(info, :invoice_file_path, path)
      {:error, _} -> info
    end
  end

  defp get_invoice_pdf_data(%Tesla.Env{} = response, %InvoiceData{
         beallitasok: %{szamlaLetoltes: true, valaszVerzio: 1}
       }) do
    response.body
  end

  defp get_invoice_pdf_data(%Tesla.Env{} = response, %InvoiceData{
         beallitasok: %{szamlaLetoltes: true, valaszVerzio: 2}
       }) do
    [pdf_tag] = Regex.run(~r/<pdf>(.*)<\/pdf>/ims, response.body, capture: :first)
    [_, base64_pdf] = String.split(pdf_tag, "<pdf>")
    [base64_pdf, _] = String.split(base64_pdf, "</pdf>")

    base64_pdf =
      base64_pdf
      |> String.trim()
      |> String.replace("\n", "")

    Base.decode64!(base64_pdf)
  end
end
