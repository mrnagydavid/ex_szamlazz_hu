defmodule ExSzamlazzHu do
  alias ExSzamlazzHu.CreateInvoice

  @moduledoc """
  A very thin wrapper for the Szamlazz.hu API.
  """
  @moduledoc since: "0.1.0"

  @doc """
  Calls the Szamlazz.hu API [to create an invoice](https://docs.szamlazz.hu/#generating-invoices).

  Returns `%ExSzamlazzHu.CreateInvoice.Result{}` struct when a call to the Szamlazz.hu API was made.
  """
  @doc since: "0.1.0"
  @spec create_invoice(params :: map()) :: {:ok, CreateInvoice.Result.t()} | {:error, :cannot_save_temporary_file} | {:error, any()}
  def create_invoice(params), do: CreateInvoice.run(params)

  @doc false
  def reverse_invoice(_params), do: {:error, :not_implemented}

  @doc false
  def register_credit_entry(_params), do: {:error, :not_implemented}

  @doc false
  def query_invoice_pdf(_params), do: {:error, :not_implemented}

  @doc false
  def query_invoice_xml(_params), do: {:error, :not_implemented}

  @doc false
  def delete_pro_forma_invoice(_params), do: {:error, :not_implemented}

  @doc false
  def create_receipt(_params), do: {:error, :not_implemented}

  @doc false
  def reverse_receipt(_params), do: {:error, :not_implemented}

  @doc false
  def query_receipt(_params), do: {:error, :not_implemented}

  @doc false
  def send_receipt(_params), do: {:error, :not_implemented}

  @doc false
  def query_taxpayers(_params), do: {:error, :not_implemented}

  @doc false
  def create_supplier_account(_params), do: {:error, :not_implemented}
end
