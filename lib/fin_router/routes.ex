defmodule FinRouter.Routes do
  use Memoize

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
  def list_routes(
        %{denom: _input_denom, amount: _input_amount},
        %{denom: _output_denom},
        _opts \\ []
      ) do
    with {:ok, pairs} <- Kujira.Fin.list_pairs(FinRouter.Node.channel()),
         {:ok, _pairs} <- load_books(pairs) do
      {:ok, [%Route{}]}
    end
  end

  defmemop load_books(pairs), expires_in: 10 * 1000 do
    pairs
    |> Task.async_stream(&Kujira.Fin.load_pair(FinRouter.Node.channel(), &1))
    |> Enum.reduce({:ok, []}, fn
      _, :error ->
        :error

      {:ok, pair}, {:ok, agg} ->
        {:ok, [pair | agg]}

      # Don't throw if a single book can't be loaded
      :error, {:ok, agg} ->
        {:ok, agg}
    end)
  end
end
