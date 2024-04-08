defmodule FinRouterWeb.GrpcView do
  use FinRouterWeb, :view

  def render("error.json", %{error: %GRPC.RPCError{message: message, status: status}}) do
    %{
      message: message,
      status: status
    }
  end
end
