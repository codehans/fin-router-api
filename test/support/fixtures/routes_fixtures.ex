defmodule FinRouter.RoutesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FinRouter.Routes` context.
  """

  @doc """
  Generate a route.
  """
  def route_fixture(attrs \\ %{}) do
    {:ok, route} =
      attrs
      |> Enum.into(%{

      })
      |> FinRouter.Routes.create_route()

    route
  end
end
