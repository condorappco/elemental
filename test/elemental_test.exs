defmodule ElementalTest do
  use ExUnit.Case
  doctest Elemental

  test "version/0" do
    assert Elemental.version() == Mix.Project.config()[:version]
  end
end
