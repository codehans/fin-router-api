defmodule FinRouter.Routes.Route.Tx.Swap do
  defstruct stages: [], min_return: []

  @type t :: %__MODULE__{
          # A 2-element string tuple (contract_address, denom_to_send)
          stages: [tuple()],
          min_return: [%{amount: integer(), denom: String.t()}]
        }
end
