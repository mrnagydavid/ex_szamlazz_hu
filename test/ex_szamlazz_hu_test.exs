defmodule ExSzamlazzHuTest do
  use ExUnit.Case, async: true
  doctest ExSzamlazzHu

  test "greets the world" do
    assert ExSzamlazzHu.create_invoice(%{}) == {:error, :not_implemented}
    assert ExSzamlazzHu.reverse_invoice(%{}) == {:error, :not_implemented}
    assert ExSzamlazzHu.register_credit_entry(%{}) == {:error, :not_implemented}
    assert ExSzamlazzHu.query_invoice_pdf(%{}) == {:error, :not_implemented}
    assert ExSzamlazzHu.query_invoice_xml(%{}) == {:error, :not_implemented}
    assert ExSzamlazzHu.delete_pro_forma_invoice(%{}) == {:error, :not_implemented}
    assert ExSzamlazzHu.create_receipt(%{}) == {:error, :not_implemented}
    assert ExSzamlazzHu.reverse_receipt(%{}) == {:error, :not_implemented}
    assert ExSzamlazzHu.query_receipt(%{}) == {:error, :not_implemented}
    assert ExSzamlazzHu.send_receipt(%{}) == {:error, :not_implemented}
    assert ExSzamlazzHu.query_taxpayers(%{}) == {:error, :not_implemented}
    assert ExSzamlazzHu.create_supplier_account(%{}) == {:error, :not_implemented}
  end
end
