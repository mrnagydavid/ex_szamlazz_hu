defmodule ExSzamlazzHu do
  alias ExSzamlazzHu.Modules.CreateInvoice

  @moduledoc """
  A very thin wrapper for the Szamlazz.hu API.

  ## Installation

      def deps do
        [
          {:ex_szamlazz_hu, "~> 0.1.0"}
        ]
      end

  ExSzamlazzHu uses Tesla as a HTTP client. This means that you should configure Tesla to use the library your project is using. E.g. in your `config/config.exs`:application

      config :tesla, :adapter, Tesla.Adapter.Hackney

  See more at [Tesla](https://hexdocs.pm/tesla/readme.html#adapters).

  ## Features

  | Szamlazz.hu function     | Is implemented? |
  | ------------------------- | --------------- |
  | Create invoice           | ✅ |
  | Reverse invoice          | ❌ |
  | Register credit entry    | ❌ |
  | Query invoice pdf        | ❌ |
  | Query invoice xml        | ❌ |
  | Delete pro forma invoice | ❌ |
  | Create receipt           | ❌ |
  | Reverse receipt          | ❌ |
  | Query receipt            | ❌ |
  | Send receipt             | ❌ |
  | Query taxpayers          | ❌ |
  | Create supplier account  | ❌ |

  ## Usage

  Even though this modules interface is in English (i.e. it provides functions like `create_invoice`),
  but as a thin wrapper, the parameters follow the same shape as described in the [Szamlazz.hu API documentation](https://docs.szamlazz.hu/).

  The result of the call is a struct, which - among other things - contains the original response from the Szamlazz.hu API.

  For convenience, the result struct contains some other information, e.g.
  - whether the call was successful or not
  - the invoice identifier, if an invoice was created
  - the path to the created invoice, if the PDF file download was requested
  - and the error code, if an error occurred.

  Read more at the given feature's documentation.
  """

  @doc """
  Create invoice via Szamlazz.hu

  The parameters follow the same shape as described in the [Szamlazz.hu API documentation](https://docs.szamlazz.hu/).

    ExSzamlazzHu.create_invoice(%{
        beallitasok: %{
          szamlaagentkulcs: "your Szamlazz.hu agent key",
          eszamla: true,
          szamlaLetoltes: false,
          valaszVerzio: 1,
        },
        fejlec: %{
          teljesitesDatum: "2023-11-12",
          fizetesiHataridoDatum: "2023-11-12",
          fizmod: "Stripe",
          penznem: "EUR",
          szamlaNyelve: "en",
          megjegyzes: "",
          rendelesSzam: "Skynet-O129A22",
          dijbekero: false,
          fizetve: true
        },
        elado: %{},
        vevo: %{
          nev: "Sarah Connor",
          orszag: "USA",
          irsz: 32456,
          telepules: "Los Angeles",
          cim: "Engineering Drive",
          email: "sarah.connor@no-skynet.com",
          sendEmail: true
        },
        tetelek: [
          %{
            megnevezes: "T-800 disassembly kit",
            mennyiseg: 2,
            mennyisegiEgyseg: "db",
            nettoEgysegar: 100,
            afakulcs: 27,
            nettoErtek: 200,
            afaErtek: 54,
            bruttoErtek: 254,
          }
        ]
      })

  The result of the call is a struct, which - among other things - contains the original response from the Szamlazz.hu API.

      {:ok, %ExSzamlazzHu.Modules.CreateInvoice.Result{success: true}} = ExSzamlazzHu.create_invoice(params)

      %ExSzamlazzHu.Modules.CreateInvoice.Result{
        success: true,                // Indicates whether the request to the szamla.hu API was successful
        raw_response: nil,            // The raw response from the szamla.hu API
        szlahu_id: nil,               // The (internal) ID of the created invoice
        szlahu_szamlaszam: nil,       // The invoice number
        szlahu_nettovegosszeg: nil,   // The net amount of the created invoice
        szlahu_bruttovegosszeg: nil,  // The gross amount of the created invoice
        szlahu_kintlevoseg: nil,      // The amount not yet paid
        szlahu_vevoifiokurl: nil,     // The URL of the invoice
        path_to_pdf_invoice: nil,     // The path to the created invoice, if the PDF file was requested
        szlahu_error: nil,            // The error message, if any (and in Hungarian)
        szlahu_error_code: nil,       // The error code
        szlahu_down: false            // Indicates whether the Szamlazz.hu API is not available
      }
  """
  @moduledoc since: "0.1.0"

  def create_invoice(params), do: CreateInvoice.run(params)
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
