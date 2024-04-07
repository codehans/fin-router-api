defmodule FinRouterWeb.RouteView do
  use FinRouterWeb, :view
  alias FinRouterWeb.RouteView

  def render("index.json", %{routes: routes}) do
    %{data: render_many(routes, RouteView, "route.json")}
  end

  def render("route.json", %{route: route}) do
    %{
      route: route.route,
      amount: Integer.to_string(route.amount),
      tx: %{
        swap: %{stages: route.tx.swap.stages, min_return: route.tx.swap.min_return}
      }
    }
  end
end
