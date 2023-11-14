defmodule ExSzamlazzHu.CreateInvoiceTest do
  use ExUnit.Case, async: false
  alias ExSzamlazzHu.CreateInvoice

  @moduletag :external

  describe "run/1" do
    test "should successfully create an invoice and save the invoice pdf locally when the response type is text" do
      params =
        params([
          {[:beallitasok, :valaszVerzio], 1},
          {[:beallitasok, :szamlaLetoltes], true}
        ])

      assert {:ok, %CreateInvoice.Result{success: true} = result} = attempt_with_retry(params)

      assert File.exists?(result.path_to_pdf_invoice)
      assert %Tesla.Env{} = result.raw_response
      assert result.raw_response.body != nil
      assert result.szlahu_id != nil
      assert result.szlahu_kintlevoseg == "0"
      assert result.szlahu_nettovegosszeg == "200"
      assert result.szlahu_bruttovegosszeg == "254"
      assert result.szlahu_szamlaszam != nil
      assert result.szlahu_vevoifiokurl != nil
      assert result.szlahu_error == nil
      assert result.szlahu_error_code == nil
      assert result.szlahu_down == false
    end

    test "should successfully create an invoice and save the invoice pdf locally when the response type is xml" do
      params =
        params([
          {[:beallitasok, :valaszVerzio], 2},
          {[:beallitasok, :szamlaLetoltes], true}
        ])

      assert {:ok, %CreateInvoice.Result{success: true} = result} = attempt_with_retry(params)

      assert File.exists?(result.path_to_pdf_invoice)
      assert %Tesla.Env{} = result.raw_response
      assert result.raw_response.body =~ "<xmlszamlavalasz"
      assert result.szlahu_id != nil
      assert result.szlahu_kintlevoseg == "0"
      assert result.szlahu_nettovegosszeg == "200"
      assert result.szlahu_bruttovegosszeg == "254"
      assert result.szlahu_szamlaszam != nil
      assert result.szlahu_vevoifiokurl != nil
      assert result.szlahu_error == nil
      assert result.szlahu_error_code == nil
      assert result.szlahu_down == false
    end

    test "should return the error code and error message when the agent key is missing" do
      params =
        params([
          {[:beallitasok, :valaszVerzio], 1},
          {[:beallitasok, :szamlaagentkulcs], ""}
        ])

      assert {:ok, %CreateInvoice.Result{success: false} = result} = attempt_with_retry(params)

      assert result.path_to_pdf_invoice == nil
      assert %Tesla.Env{} = result.raw_response
      assert result.raw_response.body =~ "[ERR]"
      assert result.szlahu_id == nil
      assert result.szlahu_kintlevoseg == nil
      assert result.szlahu_nettovegosszeg == nil
      assert result.szlahu_bruttovegosszeg == nil
      assert result.szlahu_szamlaszam == nil
      assert result.szlahu_vevoifiokurl == nil
      assert result.szlahu_error == "Hi%C3%A1nyz%C3%B3+adat%3A+Sz%C3%A1mla+Agent+kulcs+vagy+bejelentkez%C3%A9si+n%C3%A9v%2Fjelsz%C3%B3."
      assert result.szlahu_error_code == "7"
      assert result.szlahu_down == false
    end
  end

  defp params(custom_params) do
    params = %{
      beallitasok: %{
        szamlaagentkulcs: nil,
        eszamla: true,
        szamlaLetoltes: true,
        valaszVerzio: 1
      },
      fejlec: %{
        teljesitesDatum: Date.to_iso8601(Date.utc_today()),
        fizetesiHataridoDatum: Date.to_iso8601(Date.utc_today()),
        fizmod: "OTP Simple",
        penznem: "EUR",
        szamlaNyelve: "en",
        megjegyzes: "",
        rendelesSzam:
          "ExSzamlazzHu-" <>
            DateTime.to_iso8601(DateTime.utc_now()) <>
            for(_ <- 1..5, into: "", do: <<Enum.random(?a..?z)>>),
        dijbekero: false,
        fizetve: true
      },
      elado: %{},
      vevo: %{
        nev: Faker.Person.En.name(),
        orszag: Faker.Address.country(),
        irsz: Faker.Address.postcode(),
        telepules: Faker.Address.city(),
        cim: Faker.Address.street_address(),
        email: Faker.Internet.email(),
        sendEmail: false
      },
      tetelek: [
        %{
          megnevezes: Faker.Commerce.product_name(),
          mennyiseg: 2,
          mennyisegiEgyseg: "db",
          nettoEgysegar: 100,
          afakulcs: 27,
          nettoErtek: 200,
          afaErtek: 54,
          bruttoErtek: 254
        }
      ]
    }

    [{[:beallitasok, :szamlaagentkulcs], System.fetch_env!("SZAMLAZZ_AGENT_KEY")} | custom_params]
    |> Enum.reduce(params, fn {key, value}, acc ->
      put_in(acc, key, value)
    end)
  end

  defp attempt_with_retry(params) do
    case CreateInvoice.run(params) do
      {:error, :closed} -> CreateInvoice.run(params)
      result -> result
    end
  end
end
