defmodule ExSzamlazzHu.Modules.CreateInvoice.Header do
  @type t :: %__MODULE__{}

  @enforce_keys [
    :date_of_completion,
    :payment_deadline,
    :payment_method,
    :currency,
    :language
  ]
  defstruct [
    :date_of_issue,
    :date_of_completion,
    :payment_deadline,
    :payment_method,
    :currency,
    :language,
    :comment,
    :exchange_rate_bank,
    :exchange_rate,
    :order_identifier,
    :fee_request_identifier,
    :is_advance_invoice,
    :is_final_invoice,
    :advance_invoice_identifier,
    :is_correction_invoice,
    :identifier_of_corrected_invoice,
    :is_fee_request,
    :is_waybill,
    :logo_extra,
    :invoice_prefix,
    :correction_of_payable,
    :is_paid,
    :is_vat_of_margin,
    :is_european_vat,
    :invoice_draft,
    :preview_pdf
  ]

  @spec parse(map()) :: t() | nil
  def parse(nil), do: nil

  def parse(params) do
    %__MODULE__{
      date_of_issue: maybe_parse_date(params[:date_of_issue]),
      date_of_completion: maybe_parse_date(params[:date_of_completion]),
      payment_deadline: maybe_parse_date(params[:payment_deadline]),
      payment_method: params[:payment_method],
      currency: params[:currency],
      language: params[:language],
      comment: params[:comment],
      exchange_rate_bank: params[:exchange_rate_bank],
      exchange_rate: params[:exchange_rate],
      order_identifier: params[:order_identifier],
      fee_request_identifier: params[:fee_request_identifier],
      is_advance_invoice: params[:is_advance_invoice],
      is_final_invoice: params[:is_final_invoice],
      advance_invoice_identifier: params[:advance_invoice_identifier],
      is_correction_invoice: params[:is_correction_invoice],
      identifier_of_corrected_invoice: params[:identifier_of_corrected_invoice],
      is_fee_request: params[:is_fee_request],
      is_waybill: params[:is_waybill],
      logo_extra: params[:logo_extra],
      invoice_prefix: params[:invoice_prefix],
      correction_of_payable: params[:correction_of_payable],
      is_paid: params[:is_paid],
      is_vat_of_margin: params[:is_vat_of_margin],
      is_european_vat: params[:is_european_vat],
      invoice_draft: params[:invoice_draft],
      preview_pdf: params[:preview_pdf]
    }
  end

  defp maybe_parse_date(%Date{} = value), do: Date.to_iso8601(value)
  defp maybe_parse_date(value), do: value
end
