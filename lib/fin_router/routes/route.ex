defmodule FinRouter.Routes.Route do
  alias __MODULE__.Tx

  defstruct route: [], amount: 0, tx: %Tx{}

  @type t :: %{route: [String.t()], amount: number(), tx: Tx.t()}
end
