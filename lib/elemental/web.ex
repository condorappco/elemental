defmodule Elemental.Web do
  @moduledoc false

  def component do
    quote do
      use Phoenix.Component

      import Phoenix.Controller, only: [get_csrf_token: 0, view_module: 1, view_template: 1]

      unquote(html_helpers())
    end
  end

  def html_helpers do
    quote do
      import Phoenix.HTML
      import Elemental.Utils
      import Twix

      alias Phoenix.LiveView.JS
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
