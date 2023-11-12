defmodule ExSzamlazzHu.Utils.TemporaryFile do
  @moduledoc false

  def save(filename, content) do
    with dir when not is_nil(dir) <- System.tmp_dir(),
         path <- Path.join(dir, filename),
         :ok <- File.write(path, content) do
      {:ok, path}
    else
      nil -> {:error, :cannot_save_temporary_file}
      {:error, _posix} -> {:error, :cannot_save_temporary_file}
    end
  end
end
