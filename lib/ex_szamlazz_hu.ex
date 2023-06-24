defmodule ExSzamlazzHu do
  @moduledoc """
  Documentation for `ExSzamlazzHu`.
  """

  @doc """
  Create invoice via Szamlazz.hu

  ## Examples

      iex> ExSzamlazzHu.create_invoice(%{})
      {:error, :not_implemented}

  """
  def create_invoice(_params), do: {:error, :not_implemented}
  def reverse_invoice(_params), do: {:error, :not_implemented}
  def register_credit_entry(_params), do: {:error, :not_implemented}
  def query_invoice_pdf(_params), do: {:error, :not_implemented}
  def query_invoice_xml(_params), do: {:error, :not_implemented}
  def delete_pro_forma_invoice(_params), do: {:error, :not_implemented}
  def create_receipt(_params), do: {:error, :not_implemented}
  def reverse_receipt(_params), do: {:error, :not_implemented}
  def query_receipt(_params), do: {:error, :not_implemented}
  def send_receipt(_params), do: {:error, :not_implemented}
  def query_taxpayers(_params), do: {:error, :not_implemented}
  def create_supplier_account(_params), do: {:error, :not_implemented}
end
