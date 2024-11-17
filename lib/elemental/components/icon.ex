defmodule Elemental.Component.Icon do
  @moduledoc false

  use Elemental.Web, :component

  attr :rest, :global,
    doc: "the arbitrary HTML attributes for the svg container",
    include: ~w(fill stroke stroke-width)

  attr :name, :string, required: true
  attr :outline, :boolean, default: true
  attr :solid, :boolean, default: false
  attr :mini, :boolean, default: false

  def icon(assigns) do
    apply(Heroicons, String.to_atom(assigns.name), [assigns])
  end

  defmacro __using__(_) do
    quote do
      use Elemental.Web, :component

      attr :rest, :global,
        doc: "the arbitrary HTML attributes for the svg container",
        include: ~w(fill stroke stroke-width)

      attr :name, :string, required: true
      attr :outline, :boolean, default: true
      attr :solid, :boolean, default: false
      attr :mini, :boolean, default: false
    end
  end
end
