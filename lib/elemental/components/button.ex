defmodule Elemental.Component.Button do
  @moduledoc false

  use Elemental.Web, :component

  attr :class, :string, default: ""
  attr :rest, :global, include: ["class", "disabled", "form", "name", "value"]
  attr :type, :string, required: true, values: ["button", "submit", "reset"]

  slot :inner_block, required: true

  def button(assigns) do
    ~H"""
    <button class={tw([@class])} type={@type} {@rest}>
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  defmacro __using__(_) do
    quote do
      use Elemental.Web, :component

      attr :class, :string, default: ""
      attr :rest, :global, include: ["class", "disabled", "form", "name", "value"]
      attr :type, :string, required: true, values: ["button", "submit", "reset"]

      slot :inner_block, required: true
    end
  end
end
