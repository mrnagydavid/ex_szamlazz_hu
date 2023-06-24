defmodule ExSzamlazzHu.Modules.CreateInvoice.XMLBuilder do
  alias ExSzamlazzHu.Modules.CreateInvoice.InvoiceData
  alias ExSzamlazzHu.Modules.CreateInvoice.Customer
  alias ExSzamlazzHu.Modules.CreateInvoice.Item

  @spec build(InvoiceData.t()) :: {:ok, String.t()}
  def build(invoice_data) do
    {:ok, build_xml(invoice_data)}
  end

  defp build_xml(%InvoiceData{} = invoice_data) do
    """
    <?xml version="1.0" encoding="UTF-8"?>
    <xmlszamla
      xmlns="http://www.szamlazz.hu/xmlszamla"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.szamlazz.hu/xmlszamla https://www.szamlazz.hu/szamla/docs/xsds/agent/xmlszamla.xsd"
    >
      <beallitasok>
        <szamlaagentkulcs>#{invoice_data.agent_key}</szamlaagentkulcs>
        <eszamla>true</eszamla>
        <szamlaLetoltes>false</szamlaLetoltes>
        <valaszVerzio>1</valaszVerzio>
      </beallitasok>
      #{build_header(invoice_data)}
      <elado></elado>
      #{build_customer(invoice_data.customer)}
      #{build_items(invoice_data.items)}
    </xmlszamla>
    """
  end

  defp build_header(%InvoiceData{} = invoice_data) do
    """
      <fejlec>
        <teljesitesDatum>#{invoice_data.completion_date}</teljesitesDatum>
        <fizetesiHataridoDatum>#{invoice_data.payment_deadline}</fizetesiHataridoDatum>
        <fizmod>#{invoice_data.method_of_payment}</fizmod>
        <penznem>#{invoice_data.currency}</penznem>
        <szamlaNyelve>#{invoice_data.language}</szamlaNyelve>
        <megjegyzes>#{invoice_data.comment}</megjegyzes>
        <rendelesSzam>#{invoice_data.order_id}</rendelesSzam>
        <dijbekero>#{invoice_data.is_proforma}</dijbekero>
        <fizetve>#{invoice_data.is_paid}</fizetve>
      </fejlec>
    """
  end

  defp build_customer(%Customer{} = customer) do
    """
    <vevo>
      <nev>#{customer.name}</nev>
      <orszag>#{customer.country}</orszag>
      <irsz>#{customer.zip}</irsz>
      <telepules>#{customer.city}</telepules>
      <cim>#{customer.address}</cim>
      <email>#{customer.email}</email>
      <sendEmail>true</sendEmail>
    </vevo>
    """
  end

  defp build_items(items) do
    items = Enum.map(items, &build_item(&1))

    """
    <tetelek>
      #{items}
    </tetelek>
    """
  end

  def build_item(%Item{} = item) do
    """
    <tetel>
      <megnevezes>#{item.name}</megnevezes>
      <mennyiseg>#{item.quantity}</mennyiseg>
      <mennyisegiEgyseg>#{item.unit}</mennyisegiEgyseg>
      <nettoEgysegar>#{item.net_unit_price}</nettoEgysegar>
      <afakulcs>#{item.vat_key}</afakulcs>
      <nettoErtek>#{item.net_cost}</nettoErtek>
      <afaErtek>#{item.vat_cost}</afaErtek>
      <bruttoErtek>#{item.gross_cost}</bruttoErtek>
    </tetel>
    """
  end
end
