defmodule FinRouterWeb.RouteController do
  use FinRouterWeb, :controller

  alias FinRouter.Routes

  action_fallback FinRouterWeb.FallbackController

  def index(conn, %{
        "input" => %{"denom" => input_denom, "amount" => input_amount, "slippage" => slippage},
        "output" => %{"denom" => output_denom}
      }) do
    {input_amount, ""} = Integer.parse(input_amount)
    {slippage, ""} = Decimal.parse(slippage)

    routes =
      Routes.list_routes(%{denom: input_denom, amount: input_amount}, %{denom: output_denom},
        max_slippage: slippage
      )

    render(conn, "index.json", routes: routes)
  end

  def index(conn, _params) do
    with {:ok, routes} <-
           Routes.list_routes(%{denom: "dummy_denom", amount: "0"}, %{denom: "dummy_denom"}) do
      render(conn, "index.json", routes: routes)
    end
  end
end
