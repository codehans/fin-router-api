defmodule FinRouter.RoutesTest do
  use FinRouter.DataCase

  alias FinRouter.Routes

  describe "routes" do
    alias FinRouter.Routes.Route

    import FinRouter.RoutesFixtures

    test "list_routes/0 returns all routes" do
      route = route_fixture()
      assert Routes.list_routes() == [route]
    end
  end
end
