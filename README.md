# ExSzamlazzHu

A very thin wrapper for the Szamlazz.hu API.

---

## Purpose

The [Szamlazz.hu API](https://docs.szamlazz.hu) relies on `multipart/form-data` requests with an attached XML file, and the API's response is either `text/plain` or `application/xml`.

This wrapper intends to abstract away the aforementioned aspects of the communication with the API by providing an interface which can be called with standard Elixir maps, and the result is also presented with an Elixir struct.

```elixir
{:ok, %ExSzamlazzHu.CreateInvoice.Result{} = result} = ExSzamlazzHu.create_invoice(params)
```

Even though the package provides its interface in English (i.e. with functions like `create_invoice`),
but as a thin wrapper, the expected parameters follow the same shape as described in the [Szamlazz.hu API documentation](https://docs.szamlazz.hu/#xsd-scheme-compliance). This hopefully makes the adoption easier, as one would need to familiarize oneself with the service's own API anyway.

## Features

| Szamlazz.hu function     | Is it implemented? |
| ------------------------ | :----------------: |
| Create invoice           |         ✅         |
| Reverse invoice          |         ❌         |
| Register credit entry    |         ❌         |
| Query invoice pdf        |         ❌         |
| Query invoice xml        |         ❌         |
| Delete pro forma invoice |         ❌         |
| Create receipt           |         ❌         |
| Reverse receipt          |         ❌         |
| Query receipt            |         ❌         |
| Send receipt             |         ❌         |
| Query taxpayers          |         ❌         |
| Create supplier account  |         ❌         |

## Installation

The package can be installed by adding `ex_szamlazz_hu` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_szamlazz_hu, "~> 0.1.0"}
  ]
end
```

## Configuration

**Szamlazz.hu**

The authentication for Szamlazz.hu services are done using the so called "agent key" or the username/password pair.

As Szamlazz.hu expects the credentials in the request payload, this package also works the same way. You will need to provide your credentials inside the request parameters.

**Tesla**

ExSzamlazzHu uses Tesla as a HTTP client. This means that you should configure Tesla to use the library your project is using. E.g. in your `config/config.exs`:

```elixir
config :tesla, :adapter, Tesla.Adapter.Hackney
```

See more in [the Tesla documentation](https://hexdocs.pm/tesla/readme.html#adapters).

## Usage notes

The wrapper does no validation of the input parameters. The validation of the input parameters is done by Szamlazz.hu API.

The XML for the request is built using the [`xml_builder` package](https://hexdocs.pm/xml_builder) and thus the provided values are escaped when the XML is built.

## Usage example

To create an invoice via Szamlazz.hu, the parameters follow the same shape as described in the [Szamlazz.hu API documentation](https://docs.szamlazz.hu/#xsd-scheme-compliance).

```elixir
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
        megnevezes: "T-101 disassembly kit",
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
```

The result of the call is a struct, which - among other things - contains the original response from the Szamlazz.hu API.

```elixir
{:ok, %ExSzamlazzHu.CreateInvoice.Result{}} = ExSzamlazzHu.create_invoice(params)

%ExSzamlazzHu.CreateInvoice.Result{
  success: true,                # Indicates whether the invoice was created
  raw_response: nil,            # The raw response from the szamla.hu API
  path_to_pdf_invoice: nil,     # The path to the created invoice, if the PDF file was requested
  szlahu_id: nil,               # The (internal) ID of the created invoice
  szlahu_szamlaszam: nil,       # The invoice number
  szlahu_nettovegosszeg: nil,   # The net amount of the created invoice
  szlahu_bruttovegosszeg: nil,  # The gross amount of the created invoice
  szlahu_kintlevoseg: nil,      # The amount not yet paid
  szlahu_vevoifiokurl: nil,     # The URL of the invoice - ExSzamlazzHu decodes the percent-escaped string sent by Szamlazz.hu
  szlahu_error: nil,            # The error message, if any (and in Hungarian)
  szlahu_error_code: nil,       # The error code
  szlahu_down: false            # Indicates whether the Szamlazz.hu API is not available
}
```

The properties with the `szlahu` prefix are not arbitrary, these are fields returned by the API.

The `raw_response` contains the entire response of the API as a `%Tesla.Env{}` struct.

If the `params.beallitasok.szamlaLetoltes` is `true`, then Szamlazz.hu's response will contain the invoice PDF. In this case, the wrapper will attempt to save the file locally (in the temp dir), and set the `path_to_pdf_invoice` to point to the saved file. You will still be able to access the file in the response via the `raw_response` property.

If the call to Szamlazz.hu is successful, but Szamlazz.hu returns an error, the error will be described in `szlahu_error` (in Hungarian) and `szlahu_error_code` (as a string). To learn more about the error codes, check out the Szamlazz.hu API documentation [about error codes](https://docs.szamlazz.hu/#how-can-i-test-szamla-agent)
