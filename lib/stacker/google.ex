defmodule Stacker.Google do
  use ZerobsStack.HTTP

  def sample do
    get!("https://google.com")
  end
end
