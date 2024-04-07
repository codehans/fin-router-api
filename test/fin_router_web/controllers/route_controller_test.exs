defmodule FinRouterWeb.RouteControllerTest do
  use FinRouterWeb.ConnCase

  import FinRouter.RoutesFixtures

  alias FinRouter.Routes.Route

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all routes", %{conn: conn} do
      conn = get(conn, Routes.route_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end
end
