defmodule Stacker.Repo do
  use Ecto.Repo,
    otp_app: :stacker,
    adapter: Ecto.Adapters.Postgres
end
