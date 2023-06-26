defmodule ExSzamlazzHu.Utils.Validator do
  def validate(rules, struct) do
    Enum.reduce(rules, {true, %{}}, fn {key, validator}, {is_valid, errors} ->
      value = Map.get(struct, key)

      if is_list(value) do
        case validate_list(value, validator) do
          {true, _} -> {is_valid, errors}
          {false, incoming_errors} -> {false, Map.put(errors, key, incoming_errors)}
        end
      else
        case validator.(value) do
          true -> {is_valid, errors}
          false -> {false, Map.put(errors, key, :invalid)}
          :ok -> {is_valid, errors}
          {:error, incoming_errors} -> {false, Map.put(errors, key, incoming_errors)}
        end
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

  defp validate_list(list, validator_fun) do
    Enum.reduce(list, {true, []}, fn list_item, {is_valid, list} ->
      case validator_fun.(list_item) do
        true -> {is_valid, list ++ [nil]}
        false -> {false, list ++ [:invalid]}
        :ok -> {is_valid, list ++ [nil]}
        {:error, incoming_errors} -> {false, list ++ [incoming_errors]}
      end
    end)
  end
end
