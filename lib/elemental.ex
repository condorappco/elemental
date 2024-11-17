defmodule Elemental do
  @moduledoc false

  @version Mix.Project.config()[:version]

  def config(key), do: Application.get_env(:elemental, key)

  def version, do: @version
end
