defmodule Elemental.Component.Input.TextInput do
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

  def text_input(assigns) do
    ~H"""
    <div phx-feedback-for={@name}>
      <%!-- <.label for={@id} optional={@optional}><%= @label %></.label> --%>
      <input
        type={@type}
        name={@name}
        id={@id}
        value={Phoenix.HTML.Form.normalize_value(@type, @value)}
        class={
          tw([
            "mt-2 block w-full rounded-lg text-zinc-900 focus:ring-0 sm:leading-6 p-4",
            "phx-no-feedback:border-slate-400 phx-no-feedback:focus:border-slate-500",
            "border-slate-400 focus:border-slate-500 border-2 placeholder:text-slate-300",
            @errors != [] && "border-rose-400 focus:border-rose-400",
            @class
          ])
        }
        {@rest}
      />
      <%!-- <.input_hint :if={@hint != []}><%= render_slot(@hint) %></.input_hint> --%>
      <%!-- <.error :for={msg <- @errors}><%= msg %></.error> --%>
    </div>
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
