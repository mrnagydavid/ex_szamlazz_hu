defmodule ExSzamlazzHu.Modules.CreateInvoice.HeaderTest do
  use ExUnit.Case, async: true
  alias ExSzamlazzHu.Modules.CreateInvoice.Header
  alias ExSzamlazzHu.Factories.HeaderFactory

  describe "parse/1" do
    test "should parse a valid Header" do
      assert Header.parse(params()) == %Header{
               date_of_issue: "1997-08-29",
               date_of_completion: "1997-08-29",
               payment_deadline: "1997-08-29",
               payment_method: "payment_method",
               currency: "HUF",
               language: "en",
               comment: "comment",
               exchange_rate_bank: "exchange_rate_bank",
               exchange_rate: "123.4",
               order_identifier: "order_identifier",
               fee_request_identifier: "fee_request_identifier",
               is_advance_invoice: false,
               is_final_invoice: true,
               advance_invoice_identifier: nil,
               is_correction_invoice: false,
               identifier_of_corrected_invoice: nil,
               is_fee_request: false,
               is_waybill: false,
               logo_extra: "logo_extra",
               invoice_prefix: "PRFX",
               correction_of_payable: "123.4",
               is_paid: true,
               is_vat_of_margin: false,
               is_european_vat: false,
               invoice_draft: "invoice_draft",
               preview_pdf: false
             }
    end

    test "should parse an empty Header" do
      assert Header.parse(nil) == nil
    end
  end

  def params() do
    HeaderFactory.get_params(%{nope: "nope"})
  end
end
