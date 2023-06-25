defmodule ExSzamlazzHu.Utils.Validator do
  def validate(rules, struct) do
    Enum.reduce(rules, {true, %{}}, fn {key, validator}, {is_valid, errors} ->
      case validator.(Map.get(struct, key)) do
        true -> {is_valid, errors}
        false -> {false, Map.put(errors, key, :invalid)}
        :ok -> {is_valid, errors}
        {:error, incoming_errors} -> {false, Map.put(errors, key, incoming_errors)}
      end
    end)
    |> then(fn {is_valid, errors} ->
      if is_valid do
        :ok
      else
        {:error, errors}
      end
    end)
  end
end
