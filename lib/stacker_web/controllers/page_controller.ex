defmodule StackerWeb.PageController do
  use StackerWeb, :controller

  plug ZerobsStack.RateLimitPlug, %ZerobsStack.RateLimitPlug{
    name: "PageController",
    identifier: [:private, :phoenix_format]
  }

  def index(conn, _params) do
    if FunWithFlags.enabled?(:new_greeting) do
      IO.puts("New greeting would be on")
    end

    render(conn, "index.html")
  end
end
