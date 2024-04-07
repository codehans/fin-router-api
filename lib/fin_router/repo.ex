defmodule FinRouter.Repo do
  use Ecto.Repo,
    otp_app: :fin_router,
    adapter: Ecto.Adapters.SQLite3
end
