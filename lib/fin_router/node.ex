defmodule FinRouter.Node do
  use Kujira.Node,
    otp_app: :fin_router,
    pubsub: FinRouter.PubSub,
    subscriptions: ["tm.event='NewBlock'"]
end
