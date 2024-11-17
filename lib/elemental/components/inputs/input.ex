# defmodule Elemental.Component.Input.Input do
#   @moduledoc false

#   use Wardobe.Web, :component

#   # import ITBWeb.Icon
#   # import ITBWeb.Error
#   # import ITBWeb.InputHint
#   # import ITBWeb.Label

#   @doc """
#   Renders an input with label and error messages.

#   A `%Phoenix.HTML.Form{}` and field name may be passed to the input
#   to build input names and error messages, or all the attributes and
#   errors may be passed explicitly.

#   ## Examples

#       <.input field={@form[:email]} type="email" />
#       <.input name="my-input" errors={["oh no!"]} />
#   """
#   attr :id, :any, default: nil
#   attr :name, :any
#   attr :label, :string, default: nil
#   attr :value, :any

#   attr :field, Phoenix.HTML.FormField,
#     doc: "a form field struct retrieved from the form, for example: @form[:email]"

#   attr :class, :string, default: nil, doc: "classes to override the input's classes"
#   attr :errors, :list, default: []
#   attr :icon, :string, default: nil, doc: "name of icon to render"
#   attr :optional, :boolean, default: false, doc: "a label toggle to show the input is optional"

#   attr :rest, :global,
#     include: ~w(autocomplete cols disabled form list max maxlength min minlength
#                 pattern placeholder readonly required rows size step phx-target)

#   slot :hint

#   def input(%{field: %Phoenix.HTML.FormField{} = field} = assigns) do
#     assigns
#     |> assing(:type, "text")
#     |> assign(field: nil, id: assigns.id || field.id)
#     |> assign(:errors, Enum.map(field.errors, &translate_error(&1)))
#     |> assign_new(:name, fn -> field.name end)
#     |> assign_new(:value, fn -> field.value end)
#     |> input()
#   end

#   defp input(assigns) do
#     ~H"""
#     <div phx-feedback-for={@name}>
#       <.label for={@id} optional={@optional}><%= @label %></.label>
#       <input
#         type={@type}
#         name={@name}
#         id={@id}
#         value={Phoenix.HTML.Form.normalize_value(@type, @value)}
#         class={
#           tw([
#             @errors != [] && "border-rose-400 focus:border-rose-400",
#             @class
#           ])
#         }
#         {@rest}
#       />
#       <.input_hint :if={@hint != []}><%= render_slot(@hint) %></.input_hint>
#       <.error :for={msg <- @errors}><%= msg %></.error>
#     </div>
#     """
#   end
# end
