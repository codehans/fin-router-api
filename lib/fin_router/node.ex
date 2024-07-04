defmodule FinRouter.Node do
  use Kujira.Node,
    otp_app: :fin_router,
    pubsub: FinRouter.PubSub,
    subscriptions: ["message.action='/cosmwasm.wasm.v1.MsgExecuteContract'"]
end
