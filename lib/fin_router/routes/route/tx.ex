defmodule FinRouter.Routes.Route.Tx do
  alias __MODULE__.Swap

  defstruct swap: %Swap{}

  @type t :: %__MODULE__{swap: Swap.t()}
end
