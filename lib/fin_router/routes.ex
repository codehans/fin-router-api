defmodule FinRouter.Routes do
  @moduledoc """
  The Routes context.
  """

  alias FinRouter.Routes.Route

  @spec list_routes(%{:amount => number(), :denom => String.t()}, %{
          :denom => String,
          optional(any()) => any()
        }) :: {:ok, [Route.t()]} | {:error, any()}
  @doc """
  Returns the list of routes.

  ## Examples

      iex> list_routes()
      [%Route{}, ...]

  """
  def list_routes(%{denom: input_denom, amount: input_amount}, %{denom: output_denom}, opts \\ []) do
    {:ok, [%Route{}]}
  end
end
