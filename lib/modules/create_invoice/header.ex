defmodule ExSzamlazzHu.Modules.CreateInvoice.Header do
  alias ExSzamlazzHu.Utils.Validator

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
    :vat_of_margin,
    :european_vat,
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
      vat_of_margin: params[:vat_of_margin],
      european_vat: params[:european_vat],
      invoice_draft: params[:invoice_draft],
      preview_pdf: params[:preview_pdf]
    }
  end

  @spec validate(t()) :: boolean()
  def validate(struct) do
    %{
      date_of_issue: &(is_nil(&1) or is_binary(&1)),
      date_of_completion: &is_binary(&1),
      payment_deadline: &is_binary(&1),
      payment_method: &is_binary(&1),
      currency: &is_binary(&1),
      language: &is_binary(&1),
      comment: &(is_nil(&1) or is_binary(&1)),
      exchange_rate_bank: &(is_nil(&1) or is_binary(&1)),
      exchange_rate: &(is_nil(&1) or is_integer(&1) or is_float(&1)),
      order_identifier: &(is_nil(&1) or is_binary(&1)),
      fee_request_identifier: &(is_nil(&1) or is_binary(&1)),
      is_advance_invoice: &(is_nil(&1) or is_boolean(&1)),
      is_final_invoice: &(is_nil(&1) or is_boolean(&1)),
      advance_invoice_identifier: &(is_nil(&1) or is_binary(&1)),
      is_correction_invoice: &(is_nil(&1) or is_boolean(&1)),
      identifier_of_corrected_invoice: &(is_nil(&1) or is_binary(&1)),
      is_fee_request: &(is_nil(&1) or is_boolean(&1)),
      is_waybill: &(is_nil(&1) or is_boolean(&1)),
      logo_extra: &(is_nil(&1) or is_binary(&1)),
      invoice_prefix: &(is_nil(&1) or is_binary(&1)),
      correction_of_payable: &(is_nil(&1) or is_integer(&1) or is_float(&1)),
      is_paid: &(is_nil(&1) or is_boolean(&1)),
      is_var_of_margin: &(is_nil(&1) or is_boolean(&1)),
      is_european_vat: &(is_nil(&1) or is_boolean(&1)),
      invoice_draft: &(is_nil(&1) or is_binary(&1)),
      preview_pdf: &(is_nil(&1) or is_boolean(&1))
    }
    |> Validator.validate(struct)
  end

  defp maybe_parse_date(%Date{} = value), do: Date.to_iso8601(value)
  defp maybe_parse_date(value), do: value
end
